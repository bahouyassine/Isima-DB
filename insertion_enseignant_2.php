<?php require("haut.php"); ?>

<section id="main">
	<h2>Nouvel Enseignant</h2>

<?php
try{
	$req = $db->prepare('INSERT INTO ENSEIGNANT(idEnseignant,nomEnseignant,prenomEnseignant,type_enseignant,statut,organisme) VALUES (:id,:nom,:prenom,:typ,:statut,:organisme)');
    $req->execute(array('id' => htmlspecialchars($_POST['idEnseignant']), 'nom' => htmlspecialchars($_POST['nomEnseignant']), 'prenom' => htmlspecialchars($_POST['prenomEnseignant']), 'typ' => htmlspecialchars($_POST['type_enseignant']), 'statut' => htmlspecialchars($_POST['statut']), 'organisme' => htmlspecialchars($_POST['organisme'])));
	echo 'L\'insertion a bien &eacute;t&eacute; enregistr&eacute;e.<br /><br />';
}catch (Exception $e){
	die('Erreur : ' . $e->getMessage());
}
?>

</section>

<?php require("bas.php"); ?>