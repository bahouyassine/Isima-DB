<?php require("haut.php"); ?>

<section id="main">
	<h2>Suppression d'un enseignant</h2>

<?php
try{
	$req = $db->prepare('DELETE FROM ENSEIGNANT WHERE idEnseignant=:id;');
    $req->execute(array('id' => htmlspecialchars($_POST['idEnseignant'])));
	echo 'La suppression a bien &eacute;t&eacute; enregistr&eacute;e.<br /><br />';
}catch (Exception $e){
	die('Erreur : ' . $e->getMessage());
}
?>

</section>

<?php require("bas.php"); ?>