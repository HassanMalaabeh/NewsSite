<?php require_once "./db/DBOperation.php" ?>
<?php require_once "./include/Session.php" ?>
<?php require_once "./include/Functions.php" ?>
<?php
if (isset($_POST['btnSubmit'])) {
    if (empty($_POST['txtUsername']) || empty($_POST['txtPassword'])) {
        $_SESSION['errorMessage'] = 'Please fill all the fields';
    } else {
        $username = $_POST['txtUsername'];
        $password = $_POST['txtPassword'];

        $db = new DBOperation();
        $result = $db->selectUser($username, $password);
        #'<pre>' . print_r($result[2]) . '</pre>'
        if ($result[0]) {
            $_SESSION['adminID'] = $result[1][0]['id'];
            $_SESSION['admin'] = $result[1][0]['username'];
            $_SESSION['successMessage'] = 'correct login ' . $result[1][0]['username'];
            header("Location:Dashboard.php");
            exit();
        } else {
            $_SESSION['errorMessage'] = $result[1];
            header("Location:Login.php");
            exit();
        }
    }
}
?>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="images/favicon.ico">

    <title>Admin Signin</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/css/signin.css" rel="stylesheet">
</head>

<body class="text-center">
<form class="form-signin" action="Login.php" method="post">
    <div>
        <?php echo successMessage();
        echo errorMessage(); ?>
    </div>
    <div class="table-responsive">
        <table class="table table-striped table-sm">
            <tbody><!--
            <?php /*

            if (isset($_POST['btnSubmit'])) {
                if (empty($_POST['txtUsername']) || empty($_POST['txtPassword'])) {
                    $_SESSION['errorMessage'] = 'Please fill all the fields';
                } else {
                    $username = $_POST['txtUsername'];
                    $password = $_POST['txtPassword'];

                    $db = new DBOperation();
                    $result = $db->selectUser($username, $password);
                    for($i = 0; $i < $result[2]; $i++){
                        echo '<tr>';
                        echo '<td>' . $result[1][$i]['id'] . '</td>';
                        echo '<td>' . $result[1][$i]['username'] . '</td>';
                        echo '<td>' . $result[1][$i]['password'] . '</td>';
                        echo '</tr>';
                    }
                }
            }*/
            ?>-->
            </tbody>
        </table>
    </div>
    <img class="mb-4" src="https://getbootstrap.com/docs/4.0/assets/brand/bootstrap-solid.svg" alt="" width="72"
         height="72">
    <h1 class="h3 mb-3 font-weight-normal">Please sign in</h1>
    <label for="username" class="sr-only">Username</label>
    <input type="text" id="username" class="form-control" name="txtUsername" placeholder="Username" required autofocus>
    <label for="inputPassword" class="sr-only">Password</label>
    <input type="password" id="inputPassword" class="form-control" name="txtPassword" placeholder="Password" required>
    <div class="checkbox mb-3">
        <label>
            <input type="checkbox" value="remember-me" name="btnRemember"> Remember me
        </label>
    </div>
    <button class="btn btn-lg btn-primary btn-block" type="submit" name="btnSubmit">Sign in</button>
    <p class="mt-5 mb-3 text-muted">&copy; 2017-2018</p>
</form>
</body>
</html>
