<?php require("haut.php"); ?>

<section id="main">
	<h2>Modification d'un Cours</h2>		

<?php
try{
	$req = $db->query('SELECT idCours,nomCours,niveau,respCours,TC,nbCM,nbTD,nbTP FROM COURS WHERE idCours="' . htmlspecialchars($_POST["idCours"]) . '";');
	$cours = $req->fetch();
	$req->closeCursor();
}catch (Exception $e){
	die('Erreur : ' . $e->getMessage());
}
?>
	<form method="POST" action="modifier_cours_3.php">
		<input type="hidden" name="OLD_ID_COURS" value="<?php echo htmlspecialchars($_POST['idCours']); ?>" />

		Identifiant :<br />
		<input type="text" name="idCours" value="<?php echo $cours['idCours']; ?>" /><br />
	
		Nom :<br />
		<input type="text" name="nomCours" value="<?php echo $cours['nomCours']; ?>" /><br />
    
		Niveau :<br />
		<input type="text" name="niveau" value="<?php echo $cours['niveau']; ?>" /><br />

		Responsable :<br />
		<input type="text" name="respCours" value="<?php echo $cours['respCours']; ?>" /><br />

		Type de Cours :<br />
		<input type="text" name="TC" value="<?php echo $cours['TC']; ?>" /><br />	

		Nombre d'heures de CM :<br />
		<input type="text" name="nbCM" value="<?php echo $cours['nbCM']; ?>" /><br />

		Nombre d'heures de TD :<br />
		<input type="text" name="nbTD" value="<?php echo $cours['nbTD']; ?>" /><br />

		Nombre d'heures de TP :<br />
		<input type="text" name="nbTP" value="<?php echo $cours['nbTP']; ?>" /><br />
		<br />
		<input type="submit" name="envoyer" value="Confirmer" />
	</form>		
</section>

<?php require("bas.php"); ?>