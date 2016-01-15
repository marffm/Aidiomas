<?php

class Sessions {
    
    protected $registry;
    
    function __construct($registry) {
        $this->registry = $registry;
    }
    
    
    public function sessionDestroy(){
        session_destroy();
        header("Location:" . PATH_URL . "home");
    }
    
}