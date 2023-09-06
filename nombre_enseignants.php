<?php require("haut.php"); ?>

<section id="main">	
	<h2>Nombre d'enseignants</h2>
		
<?php
try{
	$req = $db->query('SELECT COUNT(*) AS NB FROM ENSEIGNANT;');
	$cmp = $req->fetch();
	$req->closeCursor();
	echo "La base de données compte " . $cmp['NB'] . " enseignants à la date du " .  date('d m Y') . ".";
}catch (Exception $e){
	die('Erreur : ' . $e->getMessage());
}
?>

</section>

<?php require("bas.php"); ?>