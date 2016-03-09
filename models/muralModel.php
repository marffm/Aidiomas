<?php

class muralModel extends Model {
    
   
    function getAllArticles() {
        
        $conn = $this->db->connectionDB();
        $stmt = $conn->prepare("SELECT * FROM mural");
        $stmt->execute();
        $results = $stmt->fetchall(PDO::FETCH_ASSOC);
        $conn = null;
        
        return $results;
        
    }
    
    function getArticlebyId($id) {
        try {
            $conn = $this->db->connectionDB();
            $stmt = $conn->prepare("SELECT * FROM mural WHERE id='$id'");
            $stmt->execute();
            $articles = $stmt->fetchall(PDO::FETCH_ASSOC);
            $conn = null;
            return $articles;
        } catch (Exception $ex) {
            echo 'Error: ' . $ex->getMessage();

        }
    }
    
}