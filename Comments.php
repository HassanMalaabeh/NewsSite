<?php require_once "./db/DBOperation.php" ?>
<?php require_once "./include/Session.php" ?>
<?php require_once "./include/Functions.php" ?>
<?php confirmLogin(); ?>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="images/favicon.ico">

    <title>Comments</title>

    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">

    <!-- Custom styles for this template -->
    <link href="css/css/starter-template.css" rel="stylesheet">
    <link href="css/css/dashboard.css" rel="stylesheet">
</head>

<body>
<nav class="navbar navbar-dark fixed-top bg-dark flex-md-nowrap p-0 shadow">
    <a class="navbar-brand col-sm-3 col-md-2 mr-0" href="Blog.php?page=1">News</a>
    <ul class="navbar-nav px-3">
        <li class="nav-item text-nowrap">
            <a class="nav-link" href="SignOut.php">Sign out</a>
        </li>
    </ul>
</nav>

<div class="container-fluid">
    <div class="row">
        <nav class="col-md-2 d-none d-md-block bg-light sidebar">
            <div class="sidebar-sticky">
                <ul class="nav flex-column">
                    <li class="nav-item">
                        <a class="nav-link" href="Dashboard.php">
                            <span data-feather="home"></span>
                            Dashboard <span class="sr-only">(current)</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="AddNewPost.php">
                            <span data-feather="file"></span>
                            Add New Post
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="Categories.php">
                            <span data-feather="shopping-cart"></span>
                            Category
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="Admins.php">
                            <span data-feather="users"></span>
                            Manage Admins
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="Comments.php">
                            <span data-feather="bar-chart-2"></span>
                            Comments
                        </a>
                    </li>
                </ul>

                <h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
                    <span>------------------------------- </span>
                    <a class="d-flex align-items-center text-muted" href="#">
                        <span data-feather="plus-circle"></span>
                    </a>
                </h6>
                <ul class="nav flex-column mb-2">
                    <li class="nav-item">
                        <a class="nav-link" href="Blog.php?page=1">
                            <span data-feather="file-text"></span>
                            Live Blog
                        </a>
                    </li>
                </ul>
            </div>
        </nav>

        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4 pt-lg-0">
            <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3">
                <h1 class="h2">Un-Approved Comments</h1>
            </div>

            <div>
                <?php echo successMessage();
                echo errorMessage();
                ?>
            </div>

            <div class="table-responsive">
                <table class="table table-striped table-sm">
                    <thead>
                    <tr>
                        <th>#</th>
                        <th>Username</th>
                        <th>Date & Time</th>
                        <th>Comment</th>
                        <th>Approve</th>
                        <th>Delete Comment</th>
                        <th>Details</th>
                    </tr>
                    </thead>
                    <tbody>
                    <?php
                    $db = new dbOperation();
                    $finalResult = $db->selectComments('off');

                    $result = $finalResult[0];
                    $rowCount = $finalResult[1];

                    for ($i = 0; $i < $rowCount; $i++) {
                        echo '<tr>';

                        echo '<td>' . ($i + 1) . '</td>';
                        echo '<td>' . $result[$i]['name'] . '</td>';
                        echo '<td>' . $result[$i]['datetime'] . '</td>';
                        echo '<td>' . $result[$i]['comment'] . '</td>';

                        echo '<td>'
                            . '<a href="./operation/ApproveComment.php?id=' . $result[$i]['id'] . '">'
                            . '<button class="btn btn-success btn-block" type="submit" name="btnApprove">Approve</button>'
                            . '</a>' . '</td>';

                        echo '<td>'
                            . '<a href="./operation/DeleteComment.php?id=' . $result[$i]['id'] . '">'
                            . '<button class="btn btn-danger btn-block" type="submit" name="btnDelete">Delete</button>'
                            . '</a>' . '</td>';

                        echo '<td>'
                            . '<a href="FullPost.php?id=' . $result[$i]['id'] . '">'
                            . '<button class="btn btn-primary" type="submit" name="btnPreview">Live Preview</button>'
                            . '</a>' . '</td>';

                        echo '</tr>';
                    }
                    ?>
                    </tbody>
                </table>
            </div>
        </main>

        <br>

        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4 pt-lg-0">
            <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3">
                <h1 class="h2">Approved Comments</h1>
            </div>

            <div class="table-responsive">
                <table class="table table-striped table-sm">
                    <thead>
                    <tr>
                        <th>#</th>
                        <th>Username</th>
                        <th>Date & Time</th>
                        <th>Comment</th>
                        <th>Approve By</th>
                        <th>Revert Approve</th>
                        <th>Delete Comment</th>
                        <th>Details</th>
                    </tr>
                    </thead>
                    <tbody>
                    <?php
                    $db = new dbOperation();
                    $finalResult = $db->selectComments('on');

                    $result = $finalResult[0];
                    $rowCount = $finalResult[1];

                    for ($i = 0; $i < $rowCount; $i++) {
                        echo '<tr>';

                        echo '<td>' . ($i + 1) . '</td>';
                        echo '<td>' . $result[$i]['name'] . '</td>';
                        echo '<td>' . $result[$i]['datetime'] . '</td>';
                        echo '<td>' . $result[$i]['comment'] . '</td>';
                        echo '<td>' . $result[$i]['approvedBy'] . '</td>';

                        echo '<td>'
                            . '<a href="./operation/UnApproveComment.php?id=' . $result[$i]['id'] . '">'
                            . '<button class="btn btn-warning btn-block" type="submit" name="btnUnApprove">Un-Approve</button>'
                            . '</a>' . '</td>';

                        echo '<td>'
                            . '<a href="./operation/DeleteComment.php?id=' . $result[$i]['id'] . '">'
                            . '<button class="btn btn-danger btn-block" type="submit" name="btnDelete">Delete</button>'
                            . '</a>' . '</td>';

                        echo '<td>'
                            . '<a href="FullPost.php?id=' . $result[$i]['id'] . '">'
                            . '<button class="btn btn-primary" type="submit" name="btnPreview">Live Preview</button>'
                            . '</a>' . '</td>';

                        echo '</tr>';
                    }
                    ?>
                    </tbody>
                </table>
            </div>
        </main>
    </div>
</div>
</body>
</html>