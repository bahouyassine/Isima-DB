<?php>	session_start(); ?>
<?php require("haut.php"); ?>

<section id="main">
	<h2>Syllabus du Cours</h2>		
		
	<table>
		<tr>
		    <th>Nom du Cours en Anglais</th>
			<th>Objectif du Cours</th>
			<th>Descriptif</th>
		</tr>
<?php
try{
    $var = $_SESSION["sauv"];
	$req1 = $db->prepare('SELECT idCours,nomCoursAnglais,objectifDuCours,descriptif
		FROM SYLLABUS');
    $req1->execute(array('cours_id' => htmlspecialchars($_POST['idCours'])));
	while ($cours = $req1->fetch()){
        if ($cours[idCours] == $var)
            echo '	<tr>
                        <td>' . $cours["nomCoursAnglais"] . '</td>
                        <td>' . $cours["objectifDuCours"] . '</td>
                        <td>' . $cours["descriptif"] . ' </td>		
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