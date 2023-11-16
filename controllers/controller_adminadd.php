<?php

if (!isset($_SESSION['pseudo'])) header('Location:?page=login');


// si le formulaire est validé, on insère dans notre table de la bdd

if (isset($_POST['submit'])) {

    $db = connectDB();
    $sql = $db->prepare("INSERT INTO picture (title,description,src,author) VALUES (?,?,?,?)");
    $sql->execute(
        [
            $_POST['title'],
            $_POST['description'],
            $_POST['src'],
            $_POST['author']
        ]
    );

    // Et on redirige sur l'admin_list
    header("Location:?page=adminlist");
} 

// on charge la vue 

include "./views/layout.phtml"; ?>