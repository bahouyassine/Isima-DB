<?php require("haut.php"); ?>

<section id="main">	
	<h2>Liste des Filières</h2>	
	<table>
		<tr>
            <th>Numéro de Filière</a></th>
			<th>Nom de la Filière</th>
			<th>Responsables de la Filière</th>
		</tr>

<?php
try{
	$req = $db->query('SELECT DISTINCT noFiliere, nomFiliere, nomEnseignant, prenomEnseignant FROM FILIERE JOIN ENSEIGNANT ON resp1Filiere = idEnseignant ORDER BY noFiliere;');
	while ($cours = $req->fetch()){
?>
	<tr>
        <td><?php echo $cours['noFiliere']; ?></td>
		<?php 
			if ($cours['noFiliere'] == '1')
				$my_ref = "https://www.isima.fr/f1-sofware-embedded-systems/";
			else if ($cours['noFiliere'] == '2')
				$my_ref = "https://www.isima.fr/f2-g%C3%A9nie-logiciel-et-syst%C3%A8mes-informatiques/";
			else if ($cours['noFiliere'] == '3')
				$my_ref = "https://www.isima.fr/f3-syst%c3%a8mes-dinformation-et-aide-%c3%a0-la-d%c3%a9cision/";
			else if ($cours['noFiliere'] == '4')
				$my_ref = "https://www.isima.fr/f4-calcul-et-mod%c3%a9lisation-scientifiques/";
			else if ($cours['noFiliere'] == '5')
				$my_ref = "https://www.isima.fr/f5-reseaux-et-securite/";
		?>
		<td><a href = <?php echo $my_ref ?> target="_blank"><?php echo $cours['nomFiliere']; ?></td>
		<td><?php echo $cours['nomEnseignant']  . ' ' . $cours['prenomEnseignant']; ?></td>
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