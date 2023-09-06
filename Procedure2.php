<?php require("haut.php"); ?>

<section id="main">
	<h2>Liste des cours de l'enseignant sélectionné</h2>
	
<?php
try{
	$req = $db->prepare('CALL LISTE_DES_COURS(:var_id_enseignant);');
	$req->execute(array('var_id_enseignant' => htmlspecialchars($_POST['id_enseignant'])));
	$toto = $req->fetchColumn();
	$req->closeCursor();
	echo  '' . $toto . '';

}catch (Exception $e){
	die('Erreur : ' . $e->getMessage());
}
?>

</section>

<?php require("bas.php"); ?>