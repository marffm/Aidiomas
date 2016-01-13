<?php

class home extends Model {
    
    protected $registry;

    function __construct($registry) {
        $this->registry = $registry;
        
    }

}