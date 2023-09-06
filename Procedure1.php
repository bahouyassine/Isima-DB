<?php require("haut.php"); ?>

<section id="main">
	<h2>Liste des cours</h2>

	<form method="post" action="Procedure2.php">
		Identifiant de l'enseignant
		<select name = "id_enseignant"> 
			<?php
			try{
				$req = $db->query('SELECT idEnseignant FROM ENSEIGNANT ORDER BY idEnseignant;');
				while ($id = $req->fetch()){
					echo '<option value="' . $id["idEnseignant"] . '">' . $id["idEnseignant"] . '</option>';	
				}
				$req->closeCursor();
			}catch (Exception $e){
				die('Erreur : ' . $e->getMessage());
			}
			?>
		</select>

		<input type="submit" name="envoyer" value="Valider" />
	</form>
</section>

<?php require("bas.php"); ?>