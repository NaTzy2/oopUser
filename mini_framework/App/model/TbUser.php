<?php
namespace OOP\App\model;

use OOP\App\config\Database;

class TbUser extends Database{
    public function getAll(){
        $statement = self::$conn->prepare("SELECT * FROM tb_user");
        $statement->execute();

        return $statement->fetchAll(\PDO::FETCH_OBJ);
    }

    public function whereId($id){
        $statement = self::$conn->prepare("SELECT * FROM trx_details WHERE id =: id");
        $statement->execute(['id'=>$id]);

        return $statement->fetch(\PDO::FETCH_OBJ);
    }

    public function insert($data){}

    public function update($data){}

    public function delete($id){
        $statement = self::$conn->prepare("DELETE FROM tb_user Where id =: id");

        return $statement->execute(['id'=>$id]);
    }
}