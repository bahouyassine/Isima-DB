<?php require("haut.php"); ?>

<section id="main">
	<h2>Nouvel Enseignant</h2>
		
	<form method="post" action="insertion_enseignant_2.php">
		Identifiant de l'Enseignant<br />
		<input type="text" name="idEnseignant" value="" /><br /><br />
	
		Nom de l'Enseignant<br />
		<input type="text" name="nomEnseignant" value="" /><br /><br />
    
		Prénom de l'Enseignant<br />
		<input type="text" name="prenomEnseignant" value="" /><br /><br />

		Type (Permanent ou Exterieur)<br />
		<input type="text" name="type_enseignant" value="" /><br /><br />

		Statut (ATER, PRCE, PRAG, MCU ou PU)<br />
		<input type="text" name="statut" value="" /><br /><br />

		Organisme <br />
		<input type="text" name="organisme" value="" /><br /><br />

		<br />
		<input type="submit" name="envoyer" value="Confirmer" /><br />
	</form>
</section>

<?php require("bas.php"); ?>