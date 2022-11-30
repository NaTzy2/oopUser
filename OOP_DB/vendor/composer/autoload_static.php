<?php

// autoload_static.php @generated by Composer

namespace Composer\Autoload;

class ComposerStaticInit72bd3ce20771a23cd0c0031639af96aa
{
    public static $prefixLengthsPsr4 = array (
        'O' => 
        array (
            'OOP\\App\\' => 8,
        ),
    );

    public static $prefixDirsPsr4 = array (
        'OOP\\App\\' => 
        array (
            0 => __DIR__ . '/../..' . '/App',
        ),
    );

    public static $classMap = array (
        'Composer\\InstalledVersions' => __DIR__ . '/..' . '/composer/InstalledVersions.php',
        'OOP\\App\\Database' => __DIR__ . '/../..' . '/App/Database.php',
        'OOP\\App\\TrxDetails' => __DIR__ . '/../..' . '/App/TrxDetails.php',
        'OOP\\App\\TrxDetailsController' => __DIR__ . '/../..' . '/App/TrxDetailsController.php',
    );

    public static function getInitializer(ClassLoader $loader)
    {
        return \Closure::bind(function () use ($loader) {
            $loader->prefixLengthsPsr4 = ComposerStaticInit72bd3ce20771a23cd0c0031639af96aa::$prefixLengthsPsr4;
            $loader->prefixDirsPsr4 = ComposerStaticInit72bd3ce20771a23cd0c0031639af96aa::$prefixDirsPsr4;
            $loader->classMap = ComposerStaticInit72bd3ce20771a23cd0c0031639af96aa::$classMap;

        }, null, ClassLoader::class);
    }
}
