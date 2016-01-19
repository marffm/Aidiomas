<?php

class muralModel extends Model {
    
   
    public function getAllArticles() {
        
        $conn = $this->db->connectionDB();
        $stmt = $conn->prepare("SELECT * FROM mural");
        $stmt->execute();
        $results = $stmt->fetchall(PDO::FETCH_ASSOC);
        $conn = null;
        
        //var_dump($results);
        
        return $results;
        
    }
    
    public function getArticlebyId($id) {
        
    }
    
}