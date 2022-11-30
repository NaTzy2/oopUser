<?php
namespace OOP\App;

// require_once 'trxDetails.php';

class TrxDetailsController{
    public static $details;

    public function __construct(){
        self::$details = new TrxDetails;
    }

    public function index(){
        print_r(self::$details->index());
    }

    public function show($id){
        print_r(self::$details->find($id));
    }

    public function update($id){
        $update = [
            'id_header=>1',
            'item_name=>"Realme 5i"',
            'total_quantity=>1',
            'prize=>2100000',
            'updated_at'=>date('Y-m-d H:i:s')
        ];
        print_r(self::$details->update($update, $id));
    }

    public function delete($id){
        print_r(self::$details->delete(($id)));
    }
}