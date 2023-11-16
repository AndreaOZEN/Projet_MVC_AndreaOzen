<?php

// inclusion modele

require_once "./models/Picture.php";

//appel classe Picture

$pic = new Picture();
$pictures = $pic->getAll();


// on charge la vue 

include "./views/layout.phtml"; ?>