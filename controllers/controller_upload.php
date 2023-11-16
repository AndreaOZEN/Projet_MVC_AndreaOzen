<?php

$error = "";
if (isset($_POST['upload'])) {
    //on copie le fichier temporaire vers le dossier uploads
    //donc notre projet...
    $tempFile = $_FILES["image_file"]["tmp_name"];
    //on peut récuperer des infos sur le fichier temporaire avec getimagesize
    $checkFile = getimagesize($tempFile);
    //Si ce n'est pas une image, le fichier est refusé
    if ($checkFile) {
        //$checkFile['mime'] retourne "image/jpeg" par exemple
        // Donc on fait un array $tabFileName avec explode sur le slash
        $tabFileName = explode("/", $checkFile['mime']);
        //du coup l'extension de fichier c'est la clef 1 du tableau
        $ext = $tabFileName[1];
        //on précise le nom du fichier basé sur un timestamp
        $newFile = "./uploads/" . time() . ".jpg";
        move_uploaded_file($tempFile, $newFile);
    } else {
        $error = "Ca va pas etre possible monsieur";
    }
}
;

include "./views/layout.phtml";