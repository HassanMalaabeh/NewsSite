<?php

include_once 'Session.php';

function dateTime()
{
    $dateTime = new DateTime();
    $result = $dateTime->format("M-d-Y H:i:s");
    return $result;
}

function confirmLogin()
{
    if (isset($_SESSION['adminID'])) {

    } else {
        $_SESSION['errorMessage'] = 'You Need To Login First';

        header("Location:Login.php");
        exit();
    }
}