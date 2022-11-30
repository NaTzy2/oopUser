<?php
namespace OOP\APP\controller;

use OOP\App\model\TbUser;

class TbUserController{
    public static $user;

    public function __construct(){
        self::$user = new TbUser;
    }

    public function index(){
        print_r(self::$user->getAll());
    }

    public function show($id){
        print_r(self::$user->whereId($id));
    }

    public function update($id){}

    public function delete($id){
        print_r(self::$user->delete(($id)));
    }
}