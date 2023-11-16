<?php

/*
$db = connectDB();
$sql = $db->prepare("SELECT * FROM picture ORDER BY id DESC LIMIT 3");
$sql->execute();
$pictures = $sql->fetchAll(PDO::FETCH_ASSOC);
*/

require_once("./models/Picture.php");
$pic = new Picture();
$pictures = $pic->getAll(3);


// la vue

include "./views/layout.phtml";