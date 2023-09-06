<?php require("haut.php"); ?>

<section id="main">
	<h2>Modification d'un Cours</h2>		

	<form method="post" action="modifier_cours_2.php">
		Identifiant du Cours à modifier
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