<?php require("haut.php"); ?>

<section id="main">
	<h2>Modification d'un Cours</h2>

<?php
try{
	$req = $db->prepare('UPDATE COURS SET idCours=:id, nomCours=:nom, niveau=:niv, respCours=:resp, TC=:tronC, nbCM=:CM, nbTD=:TD, nbTP=:TP WHERE idCours=:oldidcours;');
    $req->execute(array('id' => htmlspecialchars($_POST['idCours']), 'nom' => htmlspecialchars($_POST['nomCours']), 'niv' => htmlspecialchars($_POST['niveau']), 'resp' => htmlspecialchars($_POST['respCours']),'tronC' => htmlspecialchars($_POST['TC']),'CM' => htmlspecialchars($_POST['nbCM']), 'TD' => htmlspecialchars($_POST['nbTD']), 'TP' => htmlspecialchars($_POST['nbTP']), 'oldidcours' => htmlspecialchars($_POST['OLD_ID_COURS'])));
	echo 'La modification a bien &eacute;t&eacute; enregistr&eacute;e.<br /><br />';
}catch (Exception $e){
	die('Erreur : ' . $e->getMessage());
}
?>

</section>

<?php require("bas.php"); ?>