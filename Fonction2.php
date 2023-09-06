<?php require("haut.php"); ?>

<section id="main">
	<h2>Calcul du nombre total d'heures de cours assurés par un enseignant</h2>
	
<?php
try{
	$req1 = $db->prepare('SELECT CALCUL_TOTAL_HEURES(:var_id_enseignant);');
	$req1->execute(array('var_id_enseignant' => htmlspecialchars($_POST['id_enseignant'])));
	$heures = $req1->fetchColumn();
	$req1->closeCursor();

    $req2 = $db->prepare('SELECT nomEnseignant, prenomEnseignant FROM ENSEIGNANT WHERE idEnseignant = :var_id_enseignant;');
    $req2->execute(array('var_id_enseignant' => htmlspecialchars($_POST['id_enseignant'])));
    $enseignant = $req2->fetch();
	$req2->closeCursor();

	echo 'L`enseignant ' . $enseignant["prenomEnseignant"] . ' ' . $enseignant["nomEnseignant"] . ' doit assurer au total ' . $heures . ' heures de cours (CM+TD+TP) au cours de l`année</strong><br /><br />';
}catch (Exception $e){
	die('Erreur : ' . $e->getMessage());
}
?>

</section>
<?php require("bas.php"); ?>