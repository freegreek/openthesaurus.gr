<%@page import="java.text.*" %>
<%@page import="com.vionto.vithesaurus.*" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title><g:message code="download.title" /></title>
        <meta name="description" content="Download der freien OpenThesaurus-Daten in verschiedenen Formaten, u.a. Text und für OpenOffice.org/LibreOffice."/>
    </head>
    <body>

        <hr />
    
        <h2>Λήψη των δεδομένων</h2>

        <a href="http://www.gnu.org/licenses/lgpl-2.1.html"><img align="right" style="margin-left: 15px" src="http://creativecommons.org/images/public/cc-LGPL-a.png" alt="GNU LGPL Logo"/></a>
        <p>Το περιεχόμενο (λέξεις) του openthesaurus.gr είναι διαθέσιμο σε διάφορα φορμά αρχείων. Η διανομή τους διέπεται από την άδεια <a href="http://www.gnu.org/licenses/lgpl-2.1.html">GNU Lesser General Public License (LGPL)</a>
        <!-- text from about/index: -->
    (<a rel="license" href="http://www.eexi.gr/?q=node/25">ελληνική μετάφραση</a>). Με πιο απλά λόγια,
    αυτό σημαίνει ότι τα δεδομένα μπορούν να χρησιμοποιηθούν, να διαφοροποιηθούν, και να βελτιωθούν ενώ οι
    βελτιώσεις πρέπει να είναι επίσης διαθέσιμες υπό την LGPL και να αναφέρουν με σύνδεσμο το openthesaurus.gr
    ως αρχική πηγή.
        </p>

        <g:set var="sdf" value="${new SimpleDateFormat('yyyy-MM-dd HH:mm')}"/>

        <ul>
            <li><a href="../export/${oooDump.getName()}">Ελληνικός Θησαυρός για  OpenOffice.org 3.x / LibreOffice,
                ${sdf.format(new Date(oooDump.lastModified()))},
                ${String.format("%.2f", oooDump.length()/1000/1000)}MB</a>
            </li>

            <li><a href="../export/${textDump.getName()}">Θησαυρός σε μορφή αρχείου κειμένου (συμπιεσμένο),
                ${sdf.format(new Date(textDump.lastModified()))},
                ${String.format("%.2f", textDump.length()/1000/1000)}MB</a></li>

            <li>Για ανάπτυξη:
                <a href="../export/${dbDump.getName()}">MySQL-Dump,
                    ${sdf.format(new Date(dbDump.lastModified()))},
                    ${String.format("%.2f", dbDump.length()/1000/1000)}MB</a></li>

            <li>Βλ. επίσης: <a href="api">Πρόσβαση μέσω API</a></li>

        </ul>

        <h2>Λήψη του λογισμικού</h2>

        <p>Ο πηγαίος κώδικας του βασισμένου σε <a href="http://www.grails.org">Grails</a> ιστοτόπου είναι
          διαθέσιμος για λήψη
          <a href="https://github.com/freegreek/openthesaurus.gr">από το github</a>:</p>

          <pre style="margin-bottom: 10px" class="api">git clone https://github.com/freegreek/openthesaurus.gr</pre>.

          <p>Θα χρειαστείτε επίσης τον κώδικα για το <a href="https://github.com/freegreek/jforum-openthesaurus.gr">φόρουμ</a>
          (βασισμένο στο <a href="http://code.google.com/p/jforum2/">jforum2</a>) και για το single-sign-on μεταξύ
          openthesaurus και φόρουμ την  <a href="https://github.com/freegreek/jforumsecuresso">ελαφρώς τροποποιημένη έκδοση</a>
          (ώστε να συνεργάζεται σωστά με το jforum2) του
          <a href="http://blog.smartkey.co.uk/2009/10/secure-sso-for-jforum/">jforumsecuresso</a>.</p>

          <p>Ο κώδικας του openthesaurus.gr διέπεται από άδεια
             <a href="http://www.gnu.org/licenses/agpl.html">Affero General Public License (AGPL)</a>.
             Η εγκατάσταση περιγράφεται στο σχετικό 
             <a href="https://github.com/freegreek/openthesaurus.gr/blob/greek/README">README</a>.</p>
    </body>
</html>
