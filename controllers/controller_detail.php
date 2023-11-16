<?php
$db = connectDB();
// on récupère l'id depuis l'url
// on la convertit en entier pour être plus prudent...
$id_picture = intval($_GET['id']);
$sql = $db->prepare("SELECT * FROM picture WHERE id='" . $id_picture . "'");
$sql->execute();
// LE FETCH TOUT COURT NE RETOURNE QU'UN SEUL ARRAY PLAT
$pic = $sql->fetch(PDO::FETCH_ASSOC);

// connexion à la table comments
if (isset($_POST['submit'])) {

    $db = connectDB();
    $sql = $db->prepare("INSERT INTO comments (id_user,id_picture,text) VALUES (?,?,?)");
    $sql->execute(
        [
            $_SESSION['id'],
            $id_picture,
            $_POST['text']
        ]
    );
}
;

$sql = $db->prepare("SELECT *,
    comments.text AS comment_text,
    users.pseudo AS user_pseudo
    FROM comments 
    INNER JOIN users ON users.id = comments.id_user
    WHERE comments.id_picture=?");
$sql->execute([$id_picture]);
$comments = $sql->fetchAll(PDO::FETCH_ASSOC);


// --- on charge la vue
include "./views/layout.phtml";