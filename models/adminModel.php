<?php

class adminModel extends Model {
    
    function getMural (){
        
        $conn = $this->db->connectionDB();
        $stmt = $conn->prepare("SELECT * FROM mural");
        $stmt->execute();
        $results = $stmt->fetchall(PDO::FETCH_ASSOC);
        $conn = null;       
        
        return $results;
    }
    
}