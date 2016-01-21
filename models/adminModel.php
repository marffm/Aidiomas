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
    
    function saveMural() {
        
        $date = null;
        $title = null;
        $summary = null;
        $content = null;
        
        try {
            $conn = $this->db->connectionDB();
            $sql = "INSERT INTO mural (date, title, summary, content) VALUES ('21-01-2016', 'teste2', 'summary', 'content')";
            $stmt = $conn->prepare($sql);
            $stmt->bindValue(':date', $date, PDO::PARAM_INT);
            $stmt->bindValue(':title', $title, PDO::PARAM_STR);
            $stmt->bindValue(':summary', $summary, PDO::PARAM_STR);
            $stmt->bindValue(':content', $content, PDO::PARAM_STR);
            $stmt->execute();
            $id = $conn->lastInsertId();
            $conn = null;
            
        } catch (Exception $ex) {
            echo $ex->getMessage();
            
        }
    }

}