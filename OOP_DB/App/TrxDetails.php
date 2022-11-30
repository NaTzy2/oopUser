<?php
namespace OOP\App;

// require_once 'database.php';

class TrxDetails extends Database
{

    public function index()
    {
        $statement = self::$conn->prepare("select * from trx_details");
        $statement->execute();

        return $statement->fetchAll(\PDO::FETCH_OBJ);
    }

    public function findArr($id)
    {
        $statement = self::$conn->prepare("select * from trx_details where id=$id");
        $statement->execute();

        return $statement->fetch();
    }

    public static function find($id)
    {
        $statement = self::$conn->prepare("select * from trx_details where id=:id");
        $statement->execute(['id' => $id]); 

        return $statement->fetch(\PDO::FETCH_OBJ);
    }

    public function insert($data){
        $statement = self::$conn->prepare("INSERT INTO trx_details(id_header, item_name, total_quantity, prize, created_at)
                                           VALUES (:id_header, :item_name, :total_quantity, :prize, :created_at)");

        return $statement->execute($data);
    }

    public function update($data){
        $statement = self::$conn->prepare("UPDATE trx_details SET id_header = :id_header, item_name = :item_name, total_quantity = :total_quantity, prize = :prize, updated_at = :updated_at WHERE id = :id");
        return $statement->execute($data);
    }

    public function delete($id){
        $statement = self::$conn->prepare("DELETE FROM trx_details WHERE id = :id");
        return $statement->execute(['id'=>$id]);
    }
}



// try {
//     $trxheader  = new TrxDetails();

//     $update = [
//         'id' => 4   ,
//         'id_header' => 1,
//         'item_name' => 'ISOPLUS',
//         'total_quantity' => 1,
//         'prize' => 3000,
//         'updated_at' => date('Y-m-d H:i:s')
//     ];

//     $trxheader->update($update);

    // $trxheader->delete(8);


    // $data = $trxheader->find(4);
    // echo $data->item_name;



    // $data2 = $trxheader->findArr(2);
    // echo $data2['total_quantity']; //untuk menampilkan array menggunakan syntax sebagai berikut


    // casting
    // $data3 = $trxheader->findArr(1);
    // var_dump((object) $data3);
    // $insert = [
    //     'item_name'=>date('Y-m-d H:i:s'),
    //     'id_header'=>1,
    //     'total_quantity'=>90000,
    //     'prize'=>0,
    //     'total'=>90000,
    //     ''=>0, 
    //     'created_at'=>date('Y-m-d H:i:s')
    // ];

    // echo date('Y-m-f H:i:s');

    // $trxheader->insert($insert);



// } catch (\Throwable $th) {
//     echo $th;
// }