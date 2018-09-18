<?php


class DBConnect
{

    private $conn;

    public function __construct()
    {

    }

    public function connect()
    {
        require_once 'dbConstant.php';

        try {
            $this->conn = new PDO(dsn, dbUsername, dbPassword);
        } catch (PDOException $exception) {
            echo 'Connection failed: ' . $exception->getMessage();
        }

        return $this->conn;
    }
}