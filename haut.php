<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
		<meta name="author" content="BAHOU YASSINE" />
		<meta name="description" content="Les Cours de l'ISIMA" />
 		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<link rel="stylesheet" href="css/style.css" />
		<title>Les Cours de l'ISIMA</title>
	</head>
	<body>
		<header>
			<h1>Les Cours de l'
			<a href="https://www.isima.fr/accueil-english/" target = "_blank">
				<img src="img/isima.jpg" alt="Logo" width="60" />
			</a>
			</h1>
		</header>

		<nav class="navbar navbar-default">
			<ul class="nav navbar-nav">
				<li>
      				<a href="index.php">Accueil</a>
      			</li>
				  <li>
      				<a href="filieres.php">Filières</a>
      			</li>
      			<li>
					<a href="cours_liste.php">Tous Cours</a>
				</li>
				<li>
					<a href="enseignants_liste.php">Tous les Enseignants</a>
				</li>
			</ul>
		</nav>

<?php
try{
	$db = new PDO('mysql:host=localhost;port=3306;dbname=BAHOU_YASSINE;charset=utf8', 'root', 'root');
	$db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
}catch(Exception $e){
	die('Erreur : ' . $e->getMessage());
}
?>