//package com.vionto.vithesaurus.wikipedia;


import org.apache.commons.lang3.StringUtils;

import javax.xml.stream.XMLInputFactory;
import javax.xml.stream.XMLStreamConstants;
import javax.xml.stream.XMLStreamException;
import javax.xml.stream.XMLStreamReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.Scanner;
import java.util.HashSet;
/**
 * Read Wikipedia XML dump and print potential synonyms per article.
 */
public class WikipediaSynonymExtractor {

    


    private static final String SECTION_PREFIX = "===";
    private final Pattern XML_COMMENT_PATTERN = Pattern.compile("<!--.*?-->", Pattern.DOTALL);
    private static final Pattern BOLD_PATTERN = Pattern.compile("''''?'?(.*?)''''?'?");

    private Connection connection;

    public WikipediaSynonymExtractor() {
    }

    private void parse(File file) throws XMLStreamException, IOException, SQLException {
        connection = DriverManager.getConnection("jdbc:mysql://localhost/vithesaurus?user=root&password=");
        final XMLInputFactory factory = XMLInputFactory.newInstance();
        final FileInputStream fis = new FileInputStream(file);
        final XMLStreamReader parser = factory.createXMLStreamReader(fis);
        final List<String> synonyms = new ArrayList<String>();
        
        StringBuilder text=null;
        boolean inText=false;
        while (true) {
            final int event = parser.next();
            if (event == XMLStreamConstants.END_DOCUMENT) {
                parser.close();
                break;
            } else if (event == XMLStreamConstants.START_ELEMENT) {

                if (parser.getLocalName().equals("text")) {
                    text=new StringBuilder();
                    inText=true;
                }

            } else if (event == XMLStreamConstants.END_ELEMENT) {
                if (parser.getLocalName().equals("text")) {
                    synonyms.addAll(getSection(text.toString(),"===\\{\\{[^\\|]+\\|el\\}\\}===")); //meanings section
                    if (synonyms.size() > 1) {
                        findSynonyms(synonyms);

                    }
                    synonyms.clear();

                    inText=false;
                }
            } else if(event == XMLStreamConstants.CHARACTERS) {
                if(inText)
                    text.append(parser.getText());

            }
        }
        fis.close();
        connection.close();
    }

    private void findSynonyms(List<String> synonyms) throws SQLException, UnsupportedEncodingException {
        final PreparedStatement preparedStatement = connection.prepareStatement(
                    "SELECT DISTINCT synset.id FROM term, synset, term term2 WHERE synset.is_visible = 1 AND synset.id " +
                    "   = term.synset_id AND term.synset_id AND term2.synset_id = synset.id AND term2.word = ?");
        try {
            final Map<Integer,Integer> synsetIdToCount = new HashMap<Integer, Integer>();
            for (String synonym : synonyms) {
                preparedStatement.setString(1, synonym);
                final ResultSet resultSet = preparedStatement.executeQuery();
                //System.out.println(synonym);
                try {
                    while (resultSet.next()) {
                          //System.out.println(" " + resultSet.getInt("id"));

                        final Integer key = resultSet.getInt("id");
                        if (synsetIdToCount.containsKey(key)) {
                            synsetIdToCount.put(key, synsetIdToCount.get(key) + 1);
                        } else {
                            synsetIdToCount.put(key, 1);
                        }
                    }
                } finally {
                    resultSet.close();
                }
            }
            boolean foundAll = false;
            //System.out.println(synonyms + " " + synsetIdToCount);
            for (Map.Entry<Integer, Integer> entry : synsetIdToCount.entrySet()) {
                if (entry.getValue() == synonyms.size()) {
                    //System.out.println("Found all synonyms: " + synonyms);
                    foundAll = true;
                }
            }
            if (synsetIdToCount.size() == 0) {
                //System.out.println("Found NO synonyms: " + synonyms);
                System.out.println("[<a href=\"http://el.wikipedia.org/w/index.php?title=Ειδικό&search=" +
                                   URLEncoder.encode(synonyms.get(0), "utf-8")
                                   + "\">W</a>] <a href=\"http://www.openthesaurus.gr/synset/create?term=" +
                                   URLEncoder.encode(StringUtils.join(synonyms, "\n"), "utf-8") + "\">"
                                   + StringUtils.join(synonyms, ", ") + "</a><br/>");
            } else if (!foundAll) {
				//System.out.println("DID NOT find all synonyms: " + synonyms);
            }
        } finally {
            preparedStatement.close();
        }
    }


    public static void main(String[] args) throws XMLStreamException, IOException, SQLException {
        final WikipediaSynonymExtractor extractor = new WikipediaSynonymExtractor();
        // extractor.parse(new File("/media/data/data/corpus/wikipedia/dewiki-20100815-pages-articles.xml"));
        extractor.parse(new File(args[0]));
    }


    private HashSet<String> getSection(final String text, final String prefix) {

        final HashSet<String> terms= new HashSet<String>();
        final Scanner scanner = new Scanner(text);
        boolean inSynonymList = false;

        while (scanner.hasNextLine()) {
            final String line = scanner.nextLine();

            if (line.trim().matches(prefix)) {
                inSynonymList = true;
            } else if (inSynonymList && line.trim().startsWith(SECTION_PREFIX)) {
                // next section starts
                break;
            } else if (inSynonymList) {




                final Matcher matcher = BOLD_PATTERN.matcher(line);

                int pos = 0;
                while (matcher.find(pos)) {
                    if(matcher.group(1).indexOf("{{PAGENAME}}")<0)
                        terms.add(matcher.group(1).replace("[","").replace("]",""));


                    pos = matcher.end();
                }

            }



        }
        scanner.close();

        return terms;
    }

    private String clean(String str) {
        final Matcher matcher = XML_COMMENT_PATTERN.matcher(str);
        return matcher.replaceAll("");
    }
}