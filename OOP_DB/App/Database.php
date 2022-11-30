<?php
namespace OOP\App;

class Database{
    protected static $conn;
    protected static $username = 'root';
    protected static $password = '';
    protected static $hostname = 'localhost';
    protected static $dbname = 'db_baru';

    public function __construct(){
        Database::setConn();
    }

    public static function setConn(){
        self::$conn = new \PDO(
            "mysql:host=".self::$hostname.";dbname=".
            self::$dbname,
            self::$username,
            self::$password
        );

        self::$conn -> setAttribute(\PDO::ATTR_ERRMODE, \PDO::ERRMODE_EXCEPTION);
    }

    public function getConn(){
        return self::$conn;
    }
}

// try{
//     $db = Database::setConn();
//     print "<body style='background-color: #28282B'><marquee style='font-size: 15rem; color:gold' scrollamount='25%'>Koneksi berhasil. Tandanya: Gigih ganteng</marqee><br></body>";

// }catch(\Throwable $th){
//     throw $th;
// }