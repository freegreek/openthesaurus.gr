<%@page import="com.vionto.vithesaurus.*" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title><g:message code="faq.title" /></title>
    </head>
    <body>

        <hr />
		<h2><g:message code="faq.title" /></h2>

		<div class="faqitem">
			<div class="question">
				<a name="Τι">Τι είναι Συνώνυμο;</a>
			</div>
			<div class="answer">
				<p>Αν δύο ή περισσότερες λέξεις ή φράσεις έχουν την ίδια (ή <a href="http://www.greek-language.gr/greekLang/modern_greek/tools/lexica/glossology/show.html?id=158">σχεδόν την ίδια</a>) σημασία και εμφανίζονται στα ίδια γλωσσικά περιβάλλοντα, είναι συνώνυμες. Παραδείγματα:</p>
					
					<ul>
						<li><span class="bsp">αυτοκίνητο</span>, <span class="bsp">αμάξι</span></li>
				
						<li><span class="bsp">καταφέρνω</span>, <span class="bsp">επιτυγχάνω</span>, <span class="bsp">κατορθώνω</span></li>
						<li><span class="bsp">ανύπαντρος</span>, <span class="bsp">εργένης</span></li>
					</ul>
					
					<p>Το αν δύο λέξεις είναι συνώνυμες μπορεί να ελεγχθεί εύκολα κατασκευάζοντας μια πρόταση,
					π.χ., <span class="bsp">Πηγαίνω στη δουλειά με το <em>αυτοκίνητό</em> μου</span>.
					Εδώ μπορούμε να αντικαταστήσουμε το <span class="bsp">αυτοκίνητο</span> με το <span class="bsp">αμάξι</span> χωρίς
					να αλλάξει η σημασία της πρότασης. Άρα οι λέξεις
					<span class="bsp">αυτοκίνητο</span> και <span class="bsp">αμάξι</span> είναι συνώνυμες.</p>

					<p>Αντίθετα τα παρακάτω <em>δεν</em> είναι συνώνυμα:</p>

					<ul>
						<li><span class="bsp">ζεστός</span>, <span class="bsp">καυτός</span> (η διαφορά είναι στο "πόσο")</li>
						<li><span class="bsp">σπίτι</span>, <span class="bsp">κτίριο</span> (Το σπίτι είναι υπώνυμο του κτιρίου, όχι συνώνυμο)</li>
				
					</ul>

					<p>Τα συνώνυμα που απαρτίζουν μια έννοια σχηματίζουν μία <em>Ομάδα Συνωνύμων</em>. Μια λέξη με πολλαπλές σημασίες, όπως π.χ., 
					η <span class="bsp">"Τράπεζα"</span> --
					συμμετέχει σε τόσες ομάδες συνωνύμων όσες και οι σημασίες της
					π.χ.:</p>

					<p>Ομάδα συνωνύμων 1: <span class="bsp">Τράπεζα, πιστωτικό ίδρυμα</span><br />
					Ομάδα συνωνύμων 2: <span class="bsp">Τράπεζα, είδος τραπεζιού</span></p>				
			</div>
		</div>

		<div class="faqitem">
      <img src="${createLinkTo(dir:'images',file:message(code:'hr_light.png'))}" style="width:100%;height:2px;margin-top:20px;" alt="Trennlinie"/>
			<div class="question">
				<a name="Επεξεργαστές Κειμένου">Σε ποιούς επεξεργαστές κειμένου μπορώ να χρησιμοποιήσω απευθείας το λεξικό του OpenThesaurus.gr;</a>
			</div>
			<div class="answer">
			Το λεξικό του OpenThesaurus.gr δουλεύει με τα <a href="http://www.openoffice.org">OpenOffice.org</a> /
                <a href="http://www.documentfoundation.org/download/">LibreOffice</a> και
				<a href="http://www.papyrus.de">Papyrus</a> στα οποία και συμπεριλαμβάνεται.
			</div>
		</div>

		<div class="faqitem">
      <img src="${createLinkTo(dir:'images',file:message(code:'hr_light.png'))}" style="width:100%;height:2px;margin-top:20px;" alt="Trennlinie"/>
			<div class="question">
				<a name="αλλαγές">Τι πρέπει να προσέξω στις παρεμβάσεις μου στον OpenThesaurus.gr;</a>
			</div>
			<div class="answer">
				<ul>
					<li>Να μην υιοθετούνται μαζικά καταχωρήσεις από άλλα λεξικά ή  θησαυρούς</li>
					<li>Να χρησιμοποιείται η νέα ελληνική γλώσσα. Όπου υπάρχουν δύο εξίσου αποδεκτοί τρόποι γραφής να δίδονται και οι δύο.</li>
					<li>Να μην εισάγονται ιδιαίτερα σπάνιοι όροι</li>
					<li>Να εισάγεται μόνο η αρχική μορφή μιας λέξης, όχι οι κλίσεις.
						Παραδείγματα:<br />
						Αποδεκτό: <span class="bsp">τρέχω</span>, αλλά όχι: <span class="bsp">έτρεξα</span>, <span class="bsp">τρέχεις</span>, ...<br />
					        Αποδεκτό: <span class="bsp">Σπίτι</span>, αλλά όχι: <span class="bsp">Σπίτια</span>
					</li>
					<li>Να επισημαίνονται αναλόγως οι λέξεις της καθαρεύουσας δηλ να προστίθεται το
						<span class="bsp">(καθαρεύουσα)</span> στα δεξιά τους.</li>
					<li>Να επισημαίνονται οι λέξεις που ανήκουν σε τοπικές διαλέκτους, δηλ να προστίθεται το
                                            <span class="bsp">(τοπική)</span> στα δεξιά τους.
				</ul>
			</div>
		</div>

		<div class="faqitem">
      <img src="${createLinkTo(dir:'images',file:message(code:'hr_light.png'))}" style="width:100%;height:2px;margin-top:20px;" alt="Trennlinie"/>
			<div class="question">
				<a name="english">I'm looking for an English thesaurus.</a>
			</div>
			<div class="answer">
			<p>Please have a look at
			<a href="http://wordnetweb.princeton.edu/perl/webwn">WordNet</a> or
			<a href="http://www.thesaurus.com/">thesaurus.com</a>.</p>
			</div>
		</div>

		<%--
		<div class="faqitem">
			<div class="question">
			</div>
			<div class="answer">
			</div>
		</div>
		 --%>
    </body>
</html>
