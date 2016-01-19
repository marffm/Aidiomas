<?php

class testModel extends Model {
    
    public function getTest() {     
        
        $conn = $this->db->connectionDB();
        $stmt = $conn->prepare("SELECT * FROM teste");
        $stmt->bindValue(":id",$id, PDO::PARAM_INT);
        $stmt->execute();        
        $results = $stmt->fetchall(PDO::FETCH_ASSOC);
        $conn = null;
        
        
        
        
        
        return $results;

    }
    
    
}