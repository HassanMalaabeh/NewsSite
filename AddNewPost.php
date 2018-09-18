<?php require_once "./db/DBOperation.php" ?>
<?php require_once "./include/Session.php" ?>
<?php require_once "./include/Functions.php" ?>
<?php confirmLogin(); ?>
<?php
$admin = 'Hassan';
if (isset($_POST['btnAddPost'])) {
    if (empty($_POST['txtTitle']) || empty($_POST['category']) || empty($_FILES['image']) || empty($_POST['txtPost'])) {
        $_SESSION['errorMessage'] = 'Please fill all the fields';
    } else {
        $title = $_POST['txtTitle'];
        $category = $_POST['category'];

        $imageName = $_FILES['image']['name'];
        $image = $_FILES['image']['tmp_name'];

        $post = nl2br($_POST['txtPost']);

        $db = new DBOperation();
        $db->insertPost($title, dateTime(), $category, $admin, $imageName, $image, $post);

        $_SESSION['successMessage'] = 'Post Added successfully';
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

    <title>Add New Post</title>

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
                        <a class="nav-link active" href="AddNewPost.php">
                            <span data-feather="file"></span>
                            Add New Post
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="Categories.php">
                            <span data-feather="shopping-cart"></span>
                            Category <span class="sr-only">(current)</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="Admins.php">
                            <span data-feather="users"></span>
                            Manage Admins
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="Comments.php">
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
                <h1 class="h2">Add New Post</h1>
            </div>

            <div>
                <?php echo successMessage();
                echo errorMessage();
                ?>
            </div>

            <div class="col-md-8 order-md-1 mw-100 p-0">
                <form class="needs-validation " novalidate method="post" action="AddNewPost.php"
                      enctype="multipart/form-data">
                    <div class="mb-3">
                        <label for="title">Title</label>
                        <input type="text" class="form-control" id="title" placeholder="title" name="txtTitle">
                    </div>
                    <div class="mb-3">
                        <label for="category">Category</label>
                        <select class="custom-select d-block w-100" id="category" name="category" required>
                            <?php
                            $db = new dbOperation();
                            $finalResult = $db->selectCategory();

                            $result = $finalResult[0];
                            $rowCount = $finalResult[1];

                            for ($i = 0; $i < $rowCount; $i++) {
                                echo '<option>' . $result[$i]['category'] . '</option>';
                            }
                            ?>
                        </select>
                    </div>
                    <div class="mb-3">
                        <div class="custom-file">
                            <input type="file" class="custom-file-input" id="image"  name="image">
                            <label class="custom-file-label" for="image">Choose image</label>
                        </div>
                    </div>
                    <div class="mb-3">
                        <label for="post">Post</label>
                        <textarea class="form-control" id="post" placeholder="post" name="txtPost"
                                  rows="2"></textarea>
                    </div>
                    <button class="btn btn-success btn-lg btn-block" type="submit" name="btnAddPost">Add Post</button>
                </form>
            </div>
        </main>
    </div>
</div>
</body>
</html>