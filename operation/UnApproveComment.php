<?php require_once "./../db/dbOperation.php" ?>
<?php require_once "./../include/Session.php" ?>
<?php require_once "./../include/Functions.php" ?>
<?php
confirmLogin();
if (isset($_GET["id"])) {

    $id = $_GET['id'];
    $status = 'off';

    $db = new DBOperation();

    if ($db->approveComment($status, $id)) {
        $_SESSION['successMessage'] = 'comment unapproved successfully';
        header('Location: ' . './../Comments.php');
    } else {
        $_SESSION['errorMessage'] = 'something went wrong';
        header('Location: ' . './../Comments.php');
    }
}
?>