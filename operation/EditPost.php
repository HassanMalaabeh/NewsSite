<?php require_once "./../db/dbOperation.php" ?>
<?php require_once "./../include/Session.php" ?>
<?php require_once "./../include/Functions.php" ?>
<?php
confirmLogin();
$admin = 'Hassan';
if (isset($_POST['btnUpdate'])) {
    if (empty($_POST['txtTitle']) || empty($_POST['category']) || empty($_FILES['image']) || empty($_POST['txtPost'])) {
        $_SESSION['errorMessage'] = 'Please fill all the fields';
        header('Location:' . './../dashboard.php');
        exit;
    } else {
        $title = $_POST['txtTitle'];
        $category = $_POST['category'];

        $imageName = $_FILES['image']['name'];
        $image = $_FILES['image']['tmp_name'];

        $post = nl2br($_POST['txtPost']);

        $db = new DBOperation();
        $db->UpdatePost($title, dateTime(), $category, $admin, $imageName, $image, $post, $_GET['id']);

        $_SESSION['successMessage'] = 'Post updated successfully';
        header('Location:' . './../dashboard.php');
        exit;
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
    <link rel="icon" href="./../images/favicon.ico">

    <title>Edit Post</title>

    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="./../css/bootstrap.min.css">

    <!-- Custom styles for this template -->
    <link href="./../css/css/starter-template.css" rel="stylesheet">
    <link href="./../css/css/dashboard.css" rel="stylesheet">
</head>

<body>
<body>
<nav class="navbar navbar-dark fixed-top bg-dark flex-md-nowrap p-0 shadow">
    <a class="navbar-brand col-sm-3 col-md-2 mr-0" href="#">Company name</a>
    <input class="form-control form-control-dark w-100" type="text" placeholder="Search" aria-label="Search">
    <ul class="navbar-nav px-3">
        <li class="nav-item text-nowrap">
            <a class="nav-link" href="./../SignOut.php">Sign out</a>
        </li>
    </ul>
</nav>

<div class="container-fluid">
    <div class="row">
        <nav class="col-md-2 d-none d-md-block bg-light sidebar">
            <div class="sidebar-sticky">
                <ul class="nav flex-column">
                    <li class="nav-item">
                        <a class="nav-link" href="./../Dashboard.php">
                            <span data-feather="home"></span>
                            Dashboard <span class="sr-only">(current)</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="./../AddNewPost.php">
                            <span data-feather="file"></span>
                            Add New Post
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="./../Categories.php">
                            <span data-feather="shopping-cart"></span>
                            Category <span class="sr-only">(current)</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="./../Tags.php">
                            <span data-feather="shopping-cart"></span>
                            Tag <span class="sr-only">(current)</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="./../Admins.php">
                            <span data-feather="users"></span>
                            Manage Admins
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="./../Comments.php">
                            <span data-feather="bar-chart-2"></span>
                            Comments
                        </a>
                    </li>
                </ul>

                <h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
                    <span>Saved reports</span>
                    <a class="d-flex align-items-center text-muted" href="#">
                        <span data-feather="plus-circle"></span>
                    </a>
                </h6>
                <ul class="nav flex-column mb-2">
                    <li class="nav-item">
                        <a class="nav-link" href="./../Blog.php">
                            <span data-feather="file-text"></span>
                            Live Blog
                        </a>
                    </li>
                </ul>
            </div>
        </nav>

        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4 pt-lg-0">
            <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3">
                <h1 class="h2">Edit Post</h1>
                <div class="btn-toolbar mb-2 mb-md-0">
                    <div class="btn-group mr-2">
                        <button class="btn btn-sm btn-outline-secondary">Share</button>
                        <button class="btn btn-sm btn-outline-secondary">Export</button>
                    </div>
                    <button class="btn btn-sm btn-outline-secondary dropdown-toggle">
                        <span data-feather="calendar"></span>
                        This week
                    </button>
                </div>
            </div>

            <div>
                <?php echo successMessage();
                echo errorMessage();
                ?>
            </div>

            <?php
            if (isset($_GET['id'])) {
                $id = $_GET['id'];
                $db = new dbOperation();
                $finalResult = $db->selectPostFromID($id);

                $result = $finalResult[0];
                $rowCount = $finalResult[1];

                for ($i = 0; $i < $rowCount; $i++) {
                    $titleToUpdate = $result[$i]['title'];
                    $categoryToUpdate = $result[$i]['category'];
                    $imageToUpdate = $result[$i]['image'];
                    $postToUpdate = $result[$i]['post'];
                }
            }
            ?>

            <div class="col-md-8 order-md-1 mw-100 p-0">
                <form class="needs-validation " novalidate method="post"
                      action="EditPost.php?id=<?php echo $_GET['id']; ?>" enctype="multipart/form-data">
                    <div class="mb-3">
                        <label for="title">Title</label>
                        <input type="text" class="form-control" id="title" placeholder="title" name="txtTitle"
                               value="<?php echo $titleToUpdate; ?>">
                    </div>
                    <div class="mb-3">
                        <label for="category">Exsisting Category: </label> <?php echo $categoryToUpdate; ?>
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
                    </div><!--
                    <div class="mb-3">
                        <label for="tag">Tag</label>
                        <select class="custom-select d-block w-100" id="tag" name="tag" required multiple>
                            <?php /*
                            $db = new dbOperation();
                            $finalResult = $db->selectTag();

                            $result = $finalResult[0];
                            $rowCount = $finalResult[1];

                            for($i = 0; $i < $rowCount; $i++){
                                echo '<option>' . $result[$i]['tag'] . '</option>';
                            }*/
                    ?>
                        </select>
                    </div> -->

                    <div class="mb-3">
                        <label for="image">Exsisiting Image: </label>
                        <img src="./../upload/<?php echo $imageToUpdate; ?>" width="170px" height="50px">
                        <br>
                        <label for="image">Image</label>
                        <input type="file" class="form-control-file" id="image" placeholder="image" name="image">
                    </div>
                    <div class="mb-3">
                        <label for="post">Post</label>
                        <textarea type="file" class="form-control" id="post" placeholder="post" name="txtPost" rows="2">
                            <?php echo $postToUpdate; ?>
                        </textarea>
                    </div>
                    <button class="btn btn-success btn-lg btn-block" type="submit" name="btnUpdate">Update</button>
                </form>
            </div>
        </main>
    </div>
</div>

<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>

<!-- Icons -->
<script src="https://unpkg.com/feather-icons/dist/feather.min.js"></script>
<script>
    feather.replace()
</script>

<!-- Graphs -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.min.js"></script>
<script>
    var ctx = document.getElementById("myChart");
    var myChart = new Chart(ctx, {
        type: 'line',
        data: {
            labels: ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"],
            datasets: [{
                data: [15339, 21345, 18483, 24003, 23489, 24092, 12034],
                lineTension: 0,
                backgroundColor: 'transparent',
                borderColor: '#007bff',
                borderWidth: 4,
                pointBackgroundColor: '#007bff'
            }]
        },
        options: {
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero: false
                    }
                }]
            },
            legend: {
                display: false,
            }
        }
    });
</script>
<script src="js/bootstrap.min.js"></script>
</body>
</html>