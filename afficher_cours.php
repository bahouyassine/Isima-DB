<?php require("haut.php"); ?>


<section id="main">
	<h2>Affichage d'un cours</h2>		

	<form method="post" action="afficher_cours_2.php">
        Identifiant du cours à afficher
		<select name="idCours">

<?php
try{
	$req = $db->query('SELECT idCours FROM COURS ORDER BY idCours;');
    while ($cours = $req->fetch()){
		echo '<option value="' . $cours["idCours"] . '">' . $cours["idCours"] . '</option>';	
	}
	$req->closeCursor();
}catch (Exception $e){
	die('Erreur : ' . $e->getMessage());
}
?>
		</select>
		<input type="submit" name="envoyer" value="Valider" />
	</form>
</section>

<?php require("bas.php"); ?>