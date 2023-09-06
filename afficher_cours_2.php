<?php>	session_start(); ?>
<?php require("haut.php"); ?>
<section id="main">
	<h2>Affichage d'un cours </h2>		
		
	<table>
		<tr>
		    <th>Nom du Cours</th>
			<th>Niveau</th>
			<th>Type de Cours</th>
			<th>nbCM(en Heures)</th>
			<th>nbTD(en Heures)</th>
			<th>nbTP(en Heures)</th>
			<th>Responsable du Cours</th>
		</tr>
<?php
try{
	$req1 = $db->prepare('SELECT nomCours,niveau,respCours,TC,nbCM,nbTD,nbTP,nomEnseignant,prenomEnseignant
		FROM COURS C JOIN ENSEIGNANT E ON C.respCours = E.idEnseignant
		WHERE C.idCours = :cours_id');
    $req1->execute(array('cours_id' => htmlspecialchars($_POST['idCours'])));
	$_SESSION["sauv"] = $_POST['idCours'];
	while ($cours = $req1->fetch()){
	echo '	<tr>
				<td><a href = "syllabus.php">' . $cours["nomCours"] . '</a></td>
				<td>' . $cours["niveau"] . '</td>
				<td>' . $cours["TC"] . '</td>
				<td>' . $cours["nbCM"] . ' </td>
				<td>' . $cours["nbTD"] . ' </td>				
				<td>' . $cours["nbTP"] . ' </td>
				<td>' . $cours["nomEnseignant"] . ' ' . $cours["prenomEnseignant"] .'</td>			
			</tr>';
	}
	$req2->closeCursor();
}catch (Exception $e){
	die('Erreur : ' . $e->getMessage());
}
?>
	</table>
	<br />
</section>

<?php require("bas.php"); ?>