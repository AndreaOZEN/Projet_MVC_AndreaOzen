<?php

// inclusion modele

require_once "./models/Picture.php";

if (!isset($_SESSION['pseudo'])) header('Location:?page=login');

//appel classe Picture

if (isset($_SESSION['pseudo'])) {
    $pic = new Picture();
    $pictures = $pic->getAll();
} 

// on charge la vue 

include "./views/layout.phtml"; ?>