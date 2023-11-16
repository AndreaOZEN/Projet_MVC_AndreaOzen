<?php

session_start();

require_once("./services/database.php");

define("CONFIG_SITE_TITLE", "Mon modèle MVC PHP");
define("CONFIG_ROUTES", [
    "home" => "home",
    "gallery" => "gallery",
    "inscription" => "inscription",
    "login" => "connexion",
    "adminlist" => "adminlist",
]);

/* const DB_HOST = "localhost";
const DB_NAME = "mvc_php";
const DB_USER = "root";
const DB_PASS = "";

function connectDB(): PDO{
    $db = new PDO('mysql:host='.DB_HOST.';port=3306;dbname='.DB_NAME.';charset=utf8',DB_USER,DB_PASS);
    return $db; }
 */

// session_unset();