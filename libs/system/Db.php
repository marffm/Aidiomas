<?php

class Db extends PDO {
    
    protected $registry;
    protected $db;
            
    function __construct($registry) {
        $this->registry = $registry;
    }
    
    public function connectionDB() {
        
        $username = 'admin';
        $password = '110904';
        
        try {
            $this->db = new PDO(DB_DSN,$username,$password);
            $this->db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);            
        } catch (PDOException $e) {
            echo 'Connectio failed: ' . $e->getMessage();
        }
        
        return $this->db;
    }
       
    
}