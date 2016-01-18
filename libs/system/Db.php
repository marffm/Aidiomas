<?php

class Db extends PDO {
    
    protected $registry;
    
    function __construct($registry) {
        $this->registry = $registry;
    }
    
    public function getData() {
        
    }
   
}