<?php require("haut.php"); ?>

<section id="main">	
	<h2>Liste des cours</h2>	
	<table>
		<tr>
			<th>Nom du cours</th>
			<th>Niveau</th>
			<th>Responsable</th>
			<th>Type</th>
			<th>Nombre d'heures de CM</th>
			<th>Nombre d'heures de TD</th>
			<th>Nombre d'heures de TP</th>
		</tr>

<?php
try{
	$req = $db->query('SELECT idCours, nomCours, niveau, nomEnseignant, prenomEnseignant, TC, nbCM, nbTD, nbTP FROM COURS JOIN ENSEIGNANT ON COURS.respCours = ENSEIGNANT.idEnseignant ORDER BY Niveau, nomCours;');
	while ($cours = $req->fetch()){
?>
		<tr>
			<td><?php echo $cours['nomCours']; ?></td>
			<td><?php echo $cours['niveau']; ?></td>
			<td><?php echo $cours['nomEnseignant']  . ' ' . $cours['prenomEnseignant']; ?></td>
			<td><?php echo $cours['TC']; ?></td>
			<td><?php echo $cours['nbCM']; ?></td>
			<td><?php echo $cours['nbTD']; ?></td>
			<td><?php echo $cours['nbTP']; ?></td>
		</tr>
<?php	
	}
	$req->closeCursor();
}catch (Exception $e){
	die('Erreur : ' . $e->getMessage());
}
?>
	</table>
</section>

<?php require("bas.php"); ?>