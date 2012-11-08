<%@page import="com.vionto.vithesaurus.*" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title><g:message code="about.title" /></title>
        <meta name="description" content="Το openthesaurus.gr είναι ένας αλληλεπιδραστικός ιστοτόπος με στόχο τη δημιουργία ενός ελεύθερου θησαυρού συνωνύμων"/>
    </head>
    <body>

    <g:render template="/ads/about_bottom"/>
    <hr/>

    <h2>Περί OpenThesaurus.gr</h2>

    <p>Ο OpenThesaurus.gr είναι ένας διαδραστικός ιστότοπος με στόχο τη δημιουργία ενός ελληνικού
    λεξικού συνωνύμων. Με τον τρόπο αυτό μπορεί κανείς να συσχετίζει λέξεις με ίδια ή παρόμοια
    σημασία. Για παράδειγμα, στην
    <a href="../synset/search?q=λάθος">αναζήτηση της λέξης <span class="bsp">λάθος</span></a>
    επιστρέφονται μεταξύ άλλων τα <span class="bsp">αβλεψία, παρόραμα</span> ως συνώνυμα.</p>

    <p>Ο καθένας έχει τη δυνατότητα να παρέμβει στον OpenThesaurus.gr και είτε να διορθώσει λάθη είτε
    να ενσωματώσει νέα συνώνυμα. Η λειτουργία αναζήτησης δείχνει όλες τις σημασίες που προκύπτουν
    από μία λέξη (π.χ., <span class="bsp">ωμός</span> -&gt; <span class="bsp">ωμός, άβραστος</span>
    και άλλη καταχώρηση για το <span class="bsp">ωμός</span> -&gt;
    <span class="bsp">ακατέργαστος, τραχύς, χοντροκομμένος, άγριος</span>).</p>

    <p>Στις επιμέρους σημασίες μπορείτε να σβήσετε τυχόν λέξεις που δεν ταιριάζουν ή/και να προσθέσετε
    νέες.  Σε περίπτωση που μια αναζήτηση λέξης δεν επιστρέψει αποτελέσματα, προσφέρεται ένας σύνδεσμος 
    για να προστεθεί η λέξη στον OpenThesaurus.gr.</p>

    <h2>Άδεια Χρήσης</h2>

    <p>Τα <strong>δεδομένα</strong> του OpenThesaurus.gr όπως διατίθενται μέσω του <a href="api">API</a>
    ή των αρχείων προς <a href="download">λήψη</a>, διέπονται από την άδεια 
    <a rel="license" href="http://www.gnu.org/licenses/lgpl-2.1.html">GNU Lesser General Public License (LGPL)</a>
    (<a rel="license" href="http://www.eexi.gr/?q=node/25">ελληνική μετάφραση</a>). Με πιο απλά λόγια,
    αυτό σημαίνει ότι τα δεδομένα μπορούν να χρησιμοποιηθούν, να διαφοροποιηθούν και να βελτιωθούν, ενώ οι
    βελτιώσεις πρέπει να είναι επίσης διαθέσιμες υπό την LGPL και να αναφέρουν με σύνδεσμο το openthesaurus.gr
    ως αρχική πηγή.</p>

    <p>Τα αρχικά δεδομένα προήλθαν από τον ελληνικό θησαυρό που ήδη περιλαμβάνεται στο LibreOffice
    που με τη σειρά του είχε προκύψει από την προηγούμενη έκδοση του openthesaurus.gr (με διαφορετική
    ομάδα ανάπτυξης) και διέπονται από την ίδια άδεια (LGPL).</p>

    <p>Το OpenThesaurus.gr είναι η προσαρμογή του έργου
    <a href="https://github.com/danielnaber/openthesaurus">openthesaurus</a> για την Ελληνική γλώσσα
    (το openthesaurus υποστηρίζει τον ιστότοπο <a href="http://www.openthesaurus.de">openthesaurus.de</a>
    που παράγει το γερμανικό θησαυρό συνωνύμων του LibreOffice). Γίνεται κάθε προσπάθεια ώστε οι
    αλλαγές μας να επιστρέφουν στο openthesaurus ώστε να διευκολύνεται η προσαρμογή και σε άλλες
    γλώσσες.</p>

    <p>Ο πηγαίος κώδικας βρίσκεται στο
    <a href="https://github.com/freegreek/openthesaurus.gr">github</a>
    και διέπεται από την άδεια
    <a href="http://www.gnu.org/licenses/agpl.html">GNU AGPL</a>. Η εγκατάσταση περιγράφεται
    στο σχετικό <a href="https://github.com/freegreek/openthesaurus.gr/blob/greek/README">README</a>.</p>

    <h2>Τεχνολογίες και Εικαστικός Σχεδιασμός</h2>

    <p>Ο ιστότοπος αυτός είναι υλοποιημένος πάνω σε <a href="http://www.grails.org">Grails</a> και
    χρησιμοποιεί την <a href="http://www.mysql.com">MySQL</a> ως το σύστημα διαχείρισης βάσεων
    δεδομένων. Ο εικαστικός σχεδιασμός έχει γίνει από την Sabine Sieg.</p>

    <p>Η φιλοξενία του ιστότοπου γίνεται σε unmanaged VPS στο
       <a href="http://www.grnet.gr/">ΕΔΕΤ</a>. Τυχόν προβλήματα στη σταθερότητα ή την
       ασφάλεια της υπηρεσίας είναι αποκλειστικά δική μας ευθύνη (όχι του ΕΔΕΤ) και θα
       παρακαλούσαμε να αναφέρονται στη διεύθυνση admin στο openthesaurus τελεία gr.</p>

    </body>
</html>
