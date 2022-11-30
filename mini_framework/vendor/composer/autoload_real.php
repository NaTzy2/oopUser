<?php

// autoload_real.php @generated by Composer

class ComposerAutoloaderInitf1d488f1ad921d0e1e2496f221e7242f
{
    private static $loader;

    public static function loadClassLoader($class)
    {
        if ('Composer\Autoload\ClassLoader' === $class) {
            require __DIR__ . '/ClassLoader.php';
        }
    }

    /**
     * @return \Composer\Autoload\ClassLoader
     */
    public static function getLoader()
    {
        if (null !== self::$loader) {
            return self::$loader;
        }

        spl_autoload_register(array('ComposerAutoloaderInitf1d488f1ad921d0e1e2496f221e7242f', 'loadClassLoader'), true, true);
        self::$loader = $loader = new \Composer\Autoload\ClassLoader(\dirname(__DIR__));
        spl_autoload_unregister(array('ComposerAutoloaderInitf1d488f1ad921d0e1e2496f221e7242f', 'loadClassLoader'));

        require __DIR__ . '/autoload_static.php';
        call_user_func(\Composer\Autoload\ComposerStaticInitf1d488f1ad921d0e1e2496f221e7242f::getInitializer($loader));

        $loader->register(true);

        return $loader;
    }
}