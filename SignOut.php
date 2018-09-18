<?php require_once "./include/Session.php" ?>
<?php

$_SESSION['adminID'] = null;
$_SESSION['admin'] = null;
$_SESSION['errorMessage'] = null;
$_SESSION['successMessage'] = null;

session_unset();
session_destroy();

header('location:' . 'Login.php');
exit();
?>