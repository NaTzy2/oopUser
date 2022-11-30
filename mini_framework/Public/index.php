<?php

use OOP\App\controller\HomeController;
use OOP\App\core\Router;

require_once __DIR__. '/../vendor/autoload.php';

Router::addRoute('GET', '/', HomeController::class, 'index', []);
// Router::addRoute('GET', '/view', HomeController::class, 'view', []);

Router::run();