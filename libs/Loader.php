<?php

class Loader {
    
    private $registry;

    function __construct($registry) {
        $this->registry = $registry;
        
    }
    
    
    public function Load($nameClass) {
        $class = new $nameClass($this->registry);
        $class->index();
    }

}