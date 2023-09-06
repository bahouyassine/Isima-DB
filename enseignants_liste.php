<?php require("haut.php"); ?>

<section id="main">	
	<h2>Liste des Enseignants</h2>	
	<table>
		<tr>
			<th>Nom de l'enseigant</th>
			<th>Prénom de l'enseigant</th>
			<th>Type</th>
			<th>Statut</th>
			<th>Organisme</th>
		</tr>

<?php
try{
	$req = $db->query('SELECT * FROM ENSEIGNANT ORDER BY nomEnseignant ASC;');
	while ($cours = $req->fetch()){
?>
		<tr>
			<td><?php echo $cours['nomEnseignant']; ?></td>
			<td><?php echo $cours['prenomEnseignant']; ?></td>
			<td><?php echo $cours['type_enseignant']; ?></td>
			<td><?php echo $cours['statut']; ?></td>
			<td><?php echo $cours['organisme']; ?></td>
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