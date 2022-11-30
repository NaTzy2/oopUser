<?php
namespace OOP\APP\controller;

use OOP\App\model\TbUser;

class HomeController{
    public static $user;
    public static $dataUser;

    function __construct(){
        self::$user = new TbUser;
    }

    public function index(){
        self::$dataUser = self::$user->getAll();
        require_once __DIR__.'/../view/template/header.php';
        require_once __DIR__.'/../view/view.php';
        require_once __DIR__.'/../view/template/footer.php';     
        // self::$dataUser->render();
    }
    
    
    public function view(){
    }
}