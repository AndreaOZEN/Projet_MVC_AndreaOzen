<?php


if (isset($_POST['connexion'])) {

    $db = connectDB();


    $sql = $db->prepare('SELECT * FROM users WHERE pseudo = ? AND password = ?');
    $sql->execute(array($_POST['pseudo'], $_POST['password']));
    $connect = $sql->fetch(PDO::FETCH_ASSOC);

    if ($connect) {
        $_SESSION['pseudo'] = $connect['pseudo'];
        $_SESSION['id'] = $connect['id'];

    } else {
        $alertConnect = "Utilisateur non trouvé";
    }

    header("Location: index.php?page=home");

    exit;
}

// on charge la vue 

include "./views/layout.phtml";
