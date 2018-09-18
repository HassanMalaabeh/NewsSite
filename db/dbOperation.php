<?php


class DBOperation
{

    private $conn;

    public function __construct()
    {
        require_once 'dbConnect.php';

        $db = new DBConnect();
        $this->conn = $db->connect();
    }

    public function insertCategory($dateTime, $category, $author)
    {
        $sql = 'INSERT INTO `category` (`id`, `datetime`, `category`, `author`) VALUES (NULL , ?, ?, ?);';
        $stmt = $this->conn->prepare($sql);
        $stmt->bindParam(1, $dateTime);
        $stmt->bindParam(2, $category);
        $stmt->bindParam(3, $author);

        return $stmt->execute();
    }

    public function selectCategory()
    {
        $sql = 'SELECT * FROM `category`;';
        $stmt = $this->conn->prepare($sql);
        $stmt->execute();

        $result = $stmt->fetchAll();
        $rowCount = $stmt->rowCount();

        $finalResult = array($result, $rowCount);

        return $finalResult;
    }

    public function deleteCategory($id)
    {
        $sql = 'DELETE FROM `category` WHERE `id`= ?;';
        $stmt = $this->conn->prepare($sql);
        $stmt->bindParam(1, $id);

        return $stmt->execute();
    }

    public function insertPost($title, $dateTime, $category, $author, $imageName, $image, $post)
    {
        $sql = 'INSERT INTO `posts` (`id`, `title`, `datetime`, `category`, `author`, `image`, `post`) VALUES (NULL , ?, ?, ?, ?, ?, ?);';
        $stmt = $this->conn->prepare($sql);
        $stmt->bindParam(1, $title);
        $stmt->bindParam(2, $dateTime);
        $stmt->bindParam(3, $category);
        $stmt->bindParam(4, $author);
        $stmt->bindParam(5, $imageName);
        $stmt->bindParam(6, $post);

        $target = "upload/" . basename($imageName);
        move_uploaded_file($image, $target);

        return $stmt->execute();
    }

    public function updatePost($title, $dateTime, $category, $author, $imageName, $image, $post, $id)
    {
        $sql = 'UPDATE `posts` SET `title` = ?, `datetime` = ?, `category` = ?, `author` = ?, `image` = ?, `post` = ? WHERE `id` = ?;';
        $stmt = $this->conn->prepare($sql);
        $stmt->bindParam(1, $title);
        $stmt->bindParam(2, $dateTime);
        $stmt->bindParam(3, $category);
        $stmt->bindParam(4, $author);
        $stmt->bindParam(5, $imageName);
        $stmt->bindParam(6, $post);
        $stmt->bindParam(7, $id);

        $target = "upload/" . basename($imageName);
        move_uploaded_file($image, $target);

        return $stmt->execute();
    }

    public function selectPost()
    {
        $sql = 'SELECT * FROM `posts` ORDER BY `id` DESC ;';
        $stmt = $this->conn->prepare($sql);
        $stmt->execute();

        $result = $stmt->fetchAll();
        $rowCount = $stmt->rowCount();

        $finalResult = array($result, $rowCount);

        return $finalResult;
    }

    public function selectPostSearch($search, $offset)
    {
        $sql = 'SELECT * FROM `posts` WHERE `title` LIKE ? OR `datetime` LIKE ? OR `category` LIKE ? OR `author` LIKE ? OR `post` LIKE ? ORDER BY `id` DESC LIMIT ?, 10;';
        $stmt = $this->conn->prepare($sql);
        $stmt->bindParam(1, $search, PDO::PARAM_STR);
        $stmt->bindParam(2, $search, PDO::PARAM_STR);
        $stmt->bindParam(3, $search, PDO::PARAM_STR);
        $stmt->bindParam(4, $search, PDO::PARAM_STR);
        $stmt->bindParam(5, $search, PDO::PARAM_STR);
        $stmt->bindParam(6, $offset, PDO::PARAM_INT);
        $stmt->execute();

        $result = $stmt->fetchAll();
        $rowCount = $stmt->rowCount();

        $finalResult = array($result, $rowCount);

        return $finalResult;
    }

    public function selectLimitedPost($offset)
    {
        $sql = 'SELECT * FROM `posts` ORDER BY `id` DESC LIMIT ?, 10;';
        $stmt = $this->conn->prepare($sql);
        $stmt->bindParam(1, $offset,  PDO::PARAM_INT);
        $stmt->execute();

        $result = $stmt->fetchAll();
        $rowCount = $stmt->rowCount();

        $finalResult = array($result, $rowCount);

        return $finalResult;
    }

    public function selectPostKey($key, $value, $offset)
    {
        if($key == 'author'){
            $sql = 'SELECT * FROM `posts` WHERE `author` = ? ORDER BY `id` DESC LIMIT ?, 10;';
        }elseif($key == 'category'){
            $sql = 'SELECT * FROM `posts` WHERE `category` = ? ORDER BY `id` DESC LIMIT ?, 10;';
        }

        $stmt = $this->conn->prepare($sql);
        $stmt->bindParam(1, $value, PDO::PARAM_STR);
        $stmt->bindParam(2, $offset, PDO::PARAM_INT);
        $stmt->execute();

        $result = $stmt->fetchAll();
        $rowCount = $stmt->rowCount();

        $finalResult = array($result, $rowCount);

        return $finalResult;
    }

    public function selectPostFromID($id)
    {
        $sql = 'SELECT * FROM `posts` WHERE `id`= ?;';
        $stmt = $this->conn->prepare($sql);
        $stmt->bindParam(1, $id);
        $stmt->execute();

        $result = $stmt->fetchAll();
        $rowCount = $stmt->rowCount();

        $finalResult = array($result, $rowCount);

        return $finalResult;
    }

    public function countPosts($key, $value)
    {
        if($key == 'author'){
            $sql = 'SELECT COUNT(*) FROM `posts` WHERE `author` = ? ;';
            $stmt = $this->conn->prepare($sql);
            $stmt->bindParam(1, $value, PDO::PARAM_STR);

        }elseif($key == 'category'){
            $sql = 'SELECT COUNT(*) FROM `posts` WHERE `category` = ? ;';
            $stmt = $this->conn->prepare($sql);
            $stmt->bindParam(1, $value, PDO::PARAM_STR);
        }elseif($key == 'search'){
            $sql = 'SELECT COUNT(*) FROM `posts` WHERE `title` LIKE ? OR `datetime` LIKE ? OR `category` LIKE ? OR `author` LIKE ? OR `post` LIKE ?';
            $stmt = $this->conn->prepare($sql);
            $stmt->bindParam(1, $value, PDO::PARAM_STR);
            $stmt->bindParam(2, $value, PDO::PARAM_STR);
            $stmt->bindParam(3, $value, PDO::PARAM_STR);
            $stmt->bindParam(4, $value, PDO::PARAM_STR);
            $stmt->bindParam(5, $value, PDO::PARAM_STR);
        }else{
            $sql = 'SELECT COUNT(*) FROM `posts` ;';
            $stmt = $this->conn->prepare($sql);
        }

        $stmt->execute();

        $result = $stmt->fetchColumn();

        return $result;
    }

    public function deletePost($id)
    {
        $sql = 'DELETE FROM `posts` WHERE `id`= ?;';
        $stmt = $this->conn->prepare($sql);
        $stmt->bindParam(1, $id);

        return $stmt->execute();
    }

    public function insertAdmin($dateTime, $username, $password, $addedBy)
    {
        $sql = 'INSERT INTO `admins` (`id`, `datetime`, `username`, `password`, `added_by`) VALUES (NULL , ?, ?, ?, ?);';
        $stmt = $this->conn->prepare($sql);
        $stmt->bindParam(1, $dateTime);
        $stmt->bindParam(2, $username);
        $stmt->bindParam(3, $password);
        $stmt->bindParam(4, $addedBy);

        return $stmt->execute();
    }

    public function selectAdmin()
    {
        $sql = 'SELECT * FROM `admins`;';
        $stmt = $this->conn->prepare($sql);
        $stmt->execute();

        $result = $stmt->fetchAll();
        $rowCount = $stmt->rowCount();

        $finalResult = array($result, $rowCount);

        return $finalResult;
    }

    public function deleteAdmin($id)
    {
        $sql = 'DELETE FROM `admins` WHERE `id`= ?;';
        $stmt = $this->conn->prepare($sql);
        $stmt->bindParam(1, $id);

        return $stmt->execute();
    }

    public function insertComment($dateTime, $username, $email, $comment, $approvedBy, $status, $postID)
    {
        $sql = 'INSERT INTO `comments` (`id`, `datetime`, `name`, `email`, `comment`, `approvedBy`, `status`, `postID`) VALUES (NULL , ?, ?, ?, ?, ?, ?, ?);';
        $stmt = $this->conn->prepare($sql);
        $stmt->bindParam(1, $dateTime);
        $stmt->bindParam(2, $username);
        $stmt->bindParam(3, $email);
        $stmt->bindParam(4, $comment);
        $stmt->bindParam(5, $approvedBy);
        $stmt->bindParam(6, $status);
        $stmt->bindParam(7, $postID);

        return $stmt->execute();
    }

    public function selectComments($status)
    {
        $sql = 'SELECT * FROM `comments` WHERE `status` = ?;';
        $stmt = $this->conn->prepare($sql);
        $stmt->bindParam(1, $status);

        $stmt->execute();

        $result = $stmt->fetchAll();
        $rowCount = $stmt->rowCount();

        $finalResult = array($result, $rowCount);

        return $finalResult;
    }

    public function deleteComment($id)
    {
        $sql = 'DELETE FROM `comments` WHERE `id`= ?;';
        $stmt = $this->conn->prepare($sql);
        $stmt->bindParam(1, $id);

        return $stmt->execute();
    }

    public function approveComment($status, $id)
    {
        $sql = 'UPDATE `comments` SET `status` = ? WHERE `id` = ?;';
        $stmt = $this->conn->prepare($sql);
        $stmt->bindParam(1, $status);
        $stmt->bindParam(2, $id);

        return $stmt->execute();
    }

    public function countComments()
    {
        $sql = 'SELECT COUNT(*) FROM `comments` WHERE `status` = ?;';
        $stmt = $this->conn->prepare($sql);
        $status = 'off';
        $stmt->bindParam(1, $status);

        $stmt->execute();

        $result = $stmt->fetchColumn();

        return $result;
    }

    public function selectUser($username, $password)
    {
        $sql = 'SELECT * FROM `admins` WHERE `username` = ?  AND `password` = ? LIMIT 1;';
        $stmt = $this->conn->prepare($sql);
        $stmt->bindParam(1, $username, PDO::PARAM_STR);
        $stmt->bindParam(2, $password);
        $stmt->execute();

        $result = $stmt->fetchAll();

        if(empty($result)) {

            echo '<pre>';
            $stmt->debugDumpParams();
            echo '</pre>';
            return array(false, 'Invalid username or password');

        } else {
            $stmt->debugDumpParams();

            return array(true, $result, $stmt->debugDumpParams());
        }
    }
}