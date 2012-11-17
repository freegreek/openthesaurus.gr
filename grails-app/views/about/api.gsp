<%@page import="com.vionto.vithesaurus.*" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title><g:message code="api.title" /></title>
        <meta name="description" content="Περιγραφή του πώς λειτουργεί η πρόσβαση στα δεδομένα του openthesaurus.gr μέσω API"/>
    </head>
    <body>

        <hr />

        <h2>Πρόσβαση μέσω API (web-service)</h2>

        <ul>
          <li><a href="#general">Γενικά</a></li>
          <li><a href="#xml">Αναζήτηση για XML</a></li>
          <li><a href="#json">Αναζήτηση για JSON</a></li>
          <li><a href="#jsonp">Αναζήτηση για JSONP</a></li>
          <li><a href="#options">Επιλογές</a></li>
          <li><a href="#limits">Περιορισμοί Χρήσης</a></li>
        </ul>

		<h2><a name="general">Γενικά</a></h2>

		<p>Πολλά από τα δεδομένα αυτής της σελίδας είναι διαθέσιμα προς αναζήτηση απευθείας μέσω HTTP API.
                   Προς το παρόν υποστηρίζεται η αναζήτηση λέξεων, συνθετικών μιας λέξης και λέξεων με παρόμοια
                   ορθογραφία. Η αναζήτηση σε Wikipedia / Wiktionary δεν υποστηρίζεται ακόμα.</p>

		<p><strong>Οδηγία: όποιος σχεδιάζει να χρησιμοποιήσει το API καλό θα είναι να ενημερώνει
                πρώτα σχετικά, στη διεύθυνση <i>feedback <span>στο</span> openthesaurus.gr</i>. Μόνο έτσι θα
                μπορούμε να ενημερώνουμε έγκαιρα όλους τους χρήστες του API σχετικά με πιθανές αλλαγές.</strong></p>
		
		<h2><a name="xml">Αναζήτηση για XML</a></h2>
		
		<p>Με την παρακάτω αίτηση HTTP μπορούν να αναζητηθούν όλες οι ομάδες συνωνύμων που περιέχουν
		τη λέξη <span class="bsp">δοκιμή</span>:</p>
		
		<pre class="api"><a href="${createLinkTo(dir:'synonyme')}/search?q=δοκιμή&amp;format=text/xml">${grailsApplication.config.thesaurus.serverURL}${createLinkTo(dir:'synonyme')}/search?q=<strong>δοκιμή</strong>&amp;format=text/xml</a></pre>

        <p>Σημείωση: οι ελληνικοί χαρακτήρες πρέπει να είναι κωδικοποιημένοι με UTF-8.</p>
		
		<h3>Αποτέλεσμα</h3>
		
		<p>Το αποτέλεσμα της αναζήτησης είναι ένα XML έγγραφο με την ακόλουθη μορφή:</p>

        <%-- Use geshi (like on languagetool.org/development/ for highlighting: --%>
<pre class="api"><span style="color: #009900;"><span style="font-weight: bold; color: black;">&lt;matches<span style="font-weight: bold; color: black;">&gt;</span></span></span>
&nbsp; <span style="color: #009900;"><span style="font-weight: bold; color: black;">&lt;metaData<span style="font-weight: bold; color: black;">&gt;</span></span></span>
&nbsp; &nbsp; <span style="color: #009900;"><span style="font-weight: bold; color: black;">&lt;apiVersion</span> <span style="color: #000066;">content</span>=<span style="color: #bb0000;">&quot;0.1.3&quot;</span><span style="font-weight: bold; color: black;">/&gt;</span></span>
&nbsp; &nbsp; <span style="color: #009900;"><span style="font-weight: bold; color: black;">&lt;warning</span> <span style="color: #000066;">content</span>=<span style="color: #bb0000;">&quot;WARNING -- this XML format may be extended without warning&quot;</span><span style="font-weight: bold; color: black;">/&gt;</span></span>
&nbsp; &nbsp; <span style="color: #009900;"><span style="font-weight: bold; color: black;">&lt;copyright</span> <span style="color: #000066;">content</span>=<span style="color: #bb0000;">&quot;Copyright (C) 2011 Daniel Naber (www.danielnaber.de)&quot;</span><span style="font-weight: bold; color: black;">/&gt;</span></span>
&nbsp; &nbsp; <span style="color: #009900;"><span style="font-weight: bold; color: black;">&lt;license</span> <span style="color: #000066;">content</span>=<span style="color: #bb0000;">&quot;GNU LESSER GENERAL PUBLIC LICENSE Version 2.1&quot;</span><span style="font-weight: bold; color: black;">/&gt;</span></span>
&nbsp; &nbsp; <span style="color: #009900;"><span style="font-weight: bold; color: black;">&lt;source</span> <span style="color: #000066;">content</span>=<span style="color: #bb0000;">&quot;http://www.openthesaurus.gr&quot;</span><span style="font-weight: bold; color: black;">/&gt;</span></span>
&nbsp; &nbsp; <span style="color: #009900;"><span style="font-weight: bold; color: black;">&lt;date</span> <span style="color: #000066;">content</span>=<span style="color: #bb0000;">&quot;Sat Mar 06 22:47:25 CET 2011&quot;</span><span style="font-weight: bold; color: black;">/&gt;</span></span>
&nbsp; <span style="color: #009900;"><span style="font-weight: bold; color: black;">&lt;/metaData<span style="font-weight: bold; color: black;">&gt;</span></span></span>
&nbsp; <span style="color: #009900;"><span style="font-weight: bold; color: black;">&lt;synset</span> <span style="color: #000066;">id</span>=<span style="color: #bb0000;">&quot;1234&quot;</span><span style="font-weight: bold; color: black;">&gt;</span></span>
&nbsp; &nbsp; <span style="color: #009900;"><span style="font-weight: bold; color: black;">&lt;categories<span style="font-weight: bold; color: black;">&gt;</span></span></span>
&nbsp; &nbsp; &nbsp; <span style="color: #009900;"><span style="font-weight: bold; color: black;">&lt;category</span> <span style="color: #000066;">name</span>=<span style="color: #bb0000;">&quot;Όνομα Κατηγορίας&quot;</span><span style="font-weight: bold; color: black;">/&gt;</span></span>
&nbsp; &nbsp; <span style="color: #009900;"><span style="font-weight: bold; color: black;">&lt;/categories<span style="font-weight: bold; color: black;">&gt;</span></span></span>
&nbsp; &nbsp; <span style="color: #009900;"><span style="font-weight: bold; color: black;">&lt;term</span> <span style="color: #000066;">term</span>=<span style="color: #bb0000;">&quot;Έννοια 1, Λέξη 1&quot;</span><span style="font-weight: bold; color: black;">/&gt;</span></span>
&nbsp; &nbsp; <span style="color: #009900;"><span style="font-weight: bold; color: black;">&lt;term</span> <span style="color: #000066;">term</span>=<span style="color: #bb0000;">&quot;Έννοια 1, Λέξη 2&quot;</span><span style="font-weight: bold; color: black;">/&gt;</span></span>
&nbsp; <span style="color: #009900;"><span style="font-weight: bold; color: black;">&lt;/synset<span style="font-weight: bold; color: black;">&gt;</span></span></span>
&nbsp; <span style="color: #009900;"><span style="font-weight: bold; color: black;">&lt;synset</span> <span style="color: #000066;">id</span>=<span style="color: #bb0000;">&quot;2345&quot;</span><span style="font-weight: bold; color: black;">&gt;</span></span>
&nbsp; &nbsp; <span style="color: #009900;"><span style="font-weight: bold; color: black;">&lt;categories</span><span style="font-weight: bold; color: black;">/&gt;</span></span>
&nbsp; &nbsp; <span style="color: #009900;"><span style="font-weight: bold; color: black;">&lt;term</span> <span style="color: #000066;">term</span>=<span style="color: #bb0000;">&quot;Έννοια 2, Λέξη 1&quot;</span><span style="font-weight: bold; color: black;">/&gt;</span></span>
&nbsp; <span style="color: #009900;"><span style="font-weight: bold; color: black;">&lt;/synset<span style="font-weight: bold; color: black;">&gt;</span></span></span>
<span style="color: #009900;"><span style="font-weight: bold; color: black;">&lt;/matches<span style="font-weight: bold; color: black;">&gt;</span></span></span></pre>


        <h2><a name="json">Αναζήτηση για JSON</a></h2>
        
        <p>Αντί για <span class="apioption">text/xml</span> μπορεί να δοθεί <span class="apioption">application/json</span>
        ώστε το αποτέλεσμα να ληφθεί σε μορφή JSON.</p>
        
        <pre class="api"><a href="${createLinkTo(dir:'synonyme')}/search?q=δοκιμή&amp;format=application/json">${grailsApplication.config.thesaurus.serverURL}${createLinkTo(dir:'synonyme')}/search?q=<strong>δοκιμή</strong>&amp;format=application/json</a></pre>

        <g:render template="jsonWarning"/>
        

        <h2><a name="jsonp">Αναζήτηση για JSONP</a></h2>
        
        <p>Με την ανάθεση μιας μεθόδου callback μπορεί ο κώδικας JSON να παραδοθεί ως παράμετρος μιας συνάρτησης.
        <g:link action="jsonpExample">Ένα παράδειγμα ερώτησης;</g:link>.</p>

        <pre class="api"><a href="${createLinkTo(dir:'synonyme')}/search?q=δοκιμή&amp;format=application/json&amp;callback=myCallback">${grailsApplication.config.thesaurus.serverURL}${createLinkTo(dir:'synonyme')}/<br/>search?q=<strong>δοκιμή</strong>&amp;format=application/json&amp;callback=myCallback</a></pre>
        
        <g:render template="jsonWarning"/>


        <h2><a name="options">Επιλογές</a></h2>

        <ul class="apioptions">
          <li><span class="apioption">format=text/xml</span> ή <span class="apioption">format=application/json</span>: Ρυθμίζει
          το αν η απάντηση θα είναι σε μορφή XML ή JSON</li>
          <li><span class="apioption">callback</span>: Βλέπε <a href="#jsonp">JSONP</a></li>
          <li><span class="apioption">similar=true</span>: Με αυτή την παράμετρο δίνονται σε κάθε απάντηση επίσης έως 5 λέξεις
          με παρόμοια ορθογραφία, κάτι που χρησιμεύει στην αντιμετώπιση τυχόν λαθών πληκτρολόγησης

          <pre class="api"><a href="${createLinkTo(dir:'synonyme')}/search?q=ρόδα&amp;format=text/xml&amp;similar=true">${grailsApplication.config.thesaurus.serverURL}${createLinkTo(dir:'synonyme')}/search?q=<strong>ρόδα</strong>&amp;format=text/xml&amp;similar=true</a></pre>

          Απάντηση (Απόσπασμα):

<pre class="api">
&lt;similarterms>
  &lt;term term="έριδα" distance="2"/>
  &lt;term term="αράδα" distance="2"/>
  &lt;term term="δάδα" distance="2"/>
  &lt;term term="δόξα" distance="2"/>
  &lt;term term="κόρδα" distance="2"/>
&lt;/similarterms>
</pre>
          <tt>distance</tt> δίνει την απόσταση Levenshtein από τη λέξη αναζήτησης (οι
            προσδιορισμοί σε παρένθεση αγνοούνται στον υπολογισμό). Οι λέξεις ιεραρχούνται
            με βάση αυτή την απόσταση. Προτείνονται μόνο λέξεις που υπάρχουν στον OpenThesaurus.gr.
          </li>
          <li><span class="apioption">substring=true</span>: Με αυτή την παράμετρο δίνονται σε κάθε
          απάντηση έως 10 λέξεις που εμπεριέχουν την αναζητούμενη συμβολοσειρά ως συνθετικό. Ερώτηση
          (για παράδειγμα):

            <pre class="api"><a href="${createLinkTo(dir:'synonyme')}/search?q=πανω&amp;format=text/xml&amp;substring=true">${grailsApplication.config.thesaurus.serverURL}${createLinkTo(dir:'synonyme')}/search?q=<strong>πανω</strong>&amp;format=text/xml&amp;substring=true</a></pre>

            Απάντηση (Απόσπασμα):

<pre class="api">
&lt;substringterms>
  &lt;term term="αδαπάνως"/>
  &lt;term term="απανωτοί"/>
  &lt;term term="δαπανώ"/>
  &lt;term term="πανώγραμμα/>
  &lt;term term="τραβώ επάνω"/>
&lt;/substringterms>
</pre>
          </li>

          <li><span class="apioption">substringFromResults</span>: Καθορίζει το από ποια καταχώριση και μετά
          να επιστραφούν τα αποτελέσματα. Χρησιμοποιείται για "σελιδοποίηση" (paging) των αποτελεσμάτων, δηλ
          για να μπορούν να ζητηθούν π.χ., τα "αποτελέσματα από τη θέση 5 και μετά". Δουλεύει μόνο μαζί με
          <span class="apioption">substring=true</span>. Η προεπιλογή είναι το 0, δηλαδή επιστρέφονται τα
          αποτελέσματα ξεκινώντας από το πρώτο.</li>

          <li><span class="apioption">substringMaxResults</span>: Καθορίζει τον μέγιστο αριθμό αποτελεσμάτων
          που θα επιστραφούν (π.χ., "επέστρεψε το πολύ 5 αποτελέσματα"). Ο σκοπός είναι σε συνδυασμό με την
          παραπάνω επιλογή επιτρέπει στην εφαρμογή που καλεί το API να κάνει σελιδοποίηση (paging).
          Χρησιμοποιείται σε συνδυασμό με <span class="apioption">substring=true</span>. Η προεπιλεγμένη τιμή
          είναι 10, το μέγιστο επιτρεπόμενο όριο είναι 250.</li>

          <li><span class="apioption">startswith=true</span>: Όπως το <tt>substring=true</tt>, αλλά επιστρέφει
          μόνο λέξεις που ξεκινούν με τον όρο αναζήτησης (μόνο αυτές δηλαδή στις οποίες ο όρος που αναζητήθηκε
          είναι πρώτο συνθετικό. Ο περιορισμός του αριθμού των αποτελεσμάτων (paging) γίνεται όπως στο
          <tt>substring</tt>, με χρήση <tt>startsWithFromResults</tt> και <tt>startsWithMaxResults</tt>.</li>

          <li><span class="apioption">supersynsets=true</span>: Επιστρέφει με κάθε ομάδα συνωνύμων τα υπερώνυμά
          της (supersynsets / γενικότερες έννοιες) <em>(υποστηρίζεται μόνο σε XML ερωτήματα)</em>.</li>

          <li><span class="apioption">subsynsets=true</span>: Επιστρέφει με κάθε ομάδα συνωνύμων τα υπώνυμά της
               (subsynsets / ειδικότερες έννοιες) <em>(υποστηρίζεται μόνο σε XML ερωτήματα)</em>.</li>

          <li><span class="apioption">mode=all</span>: Ενεργοποιεί όλες τις πρόσθετες αναζητήσεις. Μέχρι στιγμής
               αυτές είναι οι <tt>similar=true</tt>,
            <tt>substring=true</tt>, <tt>supersynsets=true</tt> και <tt>subsynsets=true</tt>. Αυτή η κατάσταση
            θα πρέπει να χρησιμοποιείται μόνο για δοκιμές, για μια γενική επισκόπηση των δυνατοτήτων.</li>
        </ul>

        <h2><a name="limits">Όρια/Περιορισμοί στην ποσότητα των ερωτήσεων</a></h2>

        <p>Περισσότερες από 60 ερωτήσεις μέσω του API ανά λεπτό ανά διεύθυνση IP έχουν ως αποτέλεσμα να επιστρέφεται
        ο κωδικός λάθους  (HTTP-Code 500). Αν επιθυμείτε δυνατότητα για περισσότερα ερωτήματα μπορείτε να επικοινωνήσετε
        μαζί μας και να ζητήσετε αύξηση του ορίου αυτού. Επίσης διατίθεται προς λήψη ένα αρχείο με την πλήρη βάση
        δεδομένων του ιστοτόπου αυτού. Για εφαρμογές που χρειάζονται μεγάλο όγκο αναζητήσεων είναι προτιμότερο να
        χρησιμοποιείται αυτό το αρχείο.</p>

    </body>
</html>
