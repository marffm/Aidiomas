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
        
        $date = $_POST['date'];
        $title = $_POST['title'];
        $summary = $_POST['summary'];
        $content = $_POST['content'];
        
        try {
            $conn = $this->db->connectionDB();
            $sql = "INSERT INTO mural (date, title, summary, content) VALUES ('$date', '$title', '$summary', '$content')";
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
    
    function deleteMural($id) {
        
             
        try {
            $conn = $this->db->connectionDB();
            $sql = "DELETE FROM mural WHERE id = '$id' LIMIT 1";
            $stmt = $conn->prepare($sql);
            $stmt->bindValue(':id', $id, PDO::PARAM_INT);
            $stmt->execute();
            $conn = null;
            
        } catch (Exception $ex) {
            echo 'Error:' . $ex->getMessage();
        }
        
    }
    
    function updateMural ($id) {
        
        $date = $_POST['date'];
        $title = $_POST['title'];
        $summary = $_POST['summary'];
        $content = $_POST['content'];
        $id = $_POST['id'];
        
        try {
            
            $conn = $this->db->connectionDB();
            $sql = "UPDATE mural SET date=:date, title=:title, summary=:summary, content=:content WHERE id=:id";
            $stmt = $conn->prepare($sql);
            $stmt->bindValue(':date', $date, PDO::PARAM_INT);
            $stmt->bindValue(':title', $title, PDO::PARAM_STR);
            $stmt->bindValue(':summary', $summary, PDO::PARAM_STR);
            $stmt->bindValue(':content', $content, PDO::PARAM_STR);
            $stmt->bindValue(':id', $id, PDO::PARAM_INT);
            $stmt->execute();
            $conn = null;
            
            
        } catch (Exception $ex) {
           echo 'Erro:' . $ex->getMessage();
        }
        
    }
    
    function getProfessor() {
        
        try {
            $conn = $this->db->connectionDB();
            $stmt = $conn->prepare("SELECT nome, sobrenome FROM professor ORDER BY nome");
            $stmt->execute();
            $results = $stmt->fetchall(PDO::FETCH_ASSOC);
            $conn = null;
            
            return $results;
            
        } catch (Exception $ex) {
            echo 'Erro: ' . $ex->getMessage();
        }
    }

}