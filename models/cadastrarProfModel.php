<?php

class cadastrarProfModel extends Model {

    function insertProf() {
        try {
            $conn = $this->db->connectionDB();
            $stmt = $conn->prepare("INSERT INTO professor (nome, sobrenome, telefone, email, idioma, usuario, senha, nivel) VALUES (:nome, :sobrenome, :telefone, :email, :idioma, :usuario, :senha, :nivel)");
            $stmt->bindValue(':nome', $_POST['nome'], PDO::PARAM_STR);
            $stmt->bindValue(':sobrenome', $_POST['sobrenome'], PDO::PARAM_STR);
            $stmt->bindValue(':telefone', $_POST['telefone'], PDO::PARAM_STR);
            $stmt->bindValue(':email', $_POST['email'], PDO::PARAM_STR);
            $stmt->bindValue(':idioma', $_POST['idioma'], PDO::PARAM_INT);
            $stmt->bindValue(':usuario', $_POST['usuario'], PDO::PARAM_STR);
            $stmt->bindValue(':senha', $_POST['senha'], PDO::PARAM_STR);
            $stmt->bindValue(':nivel', 2 , PDO::PARAM_INT);
            $stmt->execute();
            $id = $conn->lastInsertId();
            $conn = null;
            
        } catch (Exception $ex) {
            echo 'Error: ' . $ex->getMessage();
        }
    }
    
    function updateProf($id) {
        try {
            $conn = $this->db->connectionDB();
            $stmt = $conn->prepare("UPDATE professor SET nome=:nome, sobrenome=:sobrenome, telefone=:telefone, email=:email, idioma=:idioma, usuario=:usuario, senha=:senha, nivel=2 WHERE id='$id'");
            $stmt->bindValue(':nome', $_POST['nome'], PDO::PARAM_STR);
            $stmt->bindValue(':sobrenome', $_POST['sobrenome'], PDO::PARAM_STR);
            $stmt->bindValue(':telefone', $_POST['telefone'], PDO::PARAM_STR);
            $stmt->bindValue(':email', $_POST['email'], PDO::PARAM_STR);
            $stmt->bindValue(':idioma', $_POST['idioma'], PDO::PARAM_INT);
            $stmt->bindValue(':usuario', $_POST['usuario'], PDO::PARAM_STR);
            $stmt->bindValue(':senha', $_POST['senha'], PDO::PARAM_STR);
            $stmt->execute();
            $conn = null;
        } catch (Exception $ex) {
            echo 'Error: ' . $ex->getMessage();
        }
    }
    
    function deleteProf($id) {
        try {
            $conn = $this->db->connectionDB();
            $stmt = $conn->prepare("DELETE FROM professor WHERE id='$id' LIMIT 1");
            $stmt->execute();
            $conn = null;
                    
        } catch (Exception $ex) {
            echo 'Error: ' . $ex->getMessage();
        }
    }

    function getProfs() {
        $conn = $this->db->connectionDB();
        $stmt = $conn->prepare("SELECT professor.* , idiomas.nome_idioma FROM professor INNER JOIN idiomas ON (professor.idioma = idiomas.id) ORDER BY nome ASC");
        $stmt->execute();
        $results = $stmt->fetchall(PDO::FETCH_ASSOC);
        $conn = null;
        
        return $results;
    }
    
    function getAlunos() {
        try {
            $conn = $this->db->connectionDB();
            $stmt = $conn->prepare("SELECT * FROM aluno");
            $stmt->execute();
            $resultsAluno = $stmt->fetchall(PDO::FETCH_ASSOC);
            $conn = null;

            return $resultsAluno;
        } catch (Exception $ex) {
            echo 'Error: ' . $ex->getMessage();
        }
    }

}
