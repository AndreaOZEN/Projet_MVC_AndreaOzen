<?php

if (isset($_SESSION['pseudo'])) header('Location:?page=home');


// si le formulaire est validé, on insère dans notre table de la bdd
if (isset($_POST['submit'])) {

    $db = connectDB();
    $sql = $db->prepare("INSERT INTO users (pseudo,nom,prenom,mail,password) VALUES (?,?,?,?,?)");
    $sql->execute(
        [
            $_POST['pseudo'],
            $_POST['nom'],
            $_POST['prenom'],
            $_POST['mail'],
            $_POST['password']
        ]
    );

}



// on charge la vue 

include "./views/layout.phtml"; ?>