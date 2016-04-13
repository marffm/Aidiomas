<?php

class cadastrarProfModel extends Model {

    function insertProf() {
        try {
            $conn = $this->db->connectionDB();
            $stmt = $conn->prepare("INSERT INTO professor (nome_prof, sobrenome_prof, telefone_prof, email_prof, idioma, usuario_prof, senha_prof, nivel) VALUES (:nome, :sobrenome, :telefone, :email, :idioma, :usuario, :senha, :nivel)");
            $stmt->bindValue(':nome', $_POST['nome_prof'], PDO::PARAM_STR);
            $stmt->bindValue(':sobrenome', $_POST['sobrenome_prof'], PDO::PARAM_STR);
            $stmt->bindValue(':telefone', $_POST['telefone_prof'], PDO::PARAM_STR);
            $stmt->bindValue(':email', $_POST['email_prof'], PDO::PARAM_STR);
            $stmt->bindValue(':idioma', $_POST['idioma'], PDO::PARAM_INT);
            $stmt->bindValue(':usuario', $_POST['usuario_prof'], PDO::PARAM_STR);
            $stmt->bindValue(':senha', $_POST['senha_prof'], PDO::PARAM_STR);
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
            $stmt = $conn->prepare("UPDATE professor SET nome_prof=:nome, sobrenome_prof=:sobrenome, telefone_prof=:telefone, email_prof=:email, idioma=:idioma, usuario_prof=:usuario, senha_prof=:senha, nivel=2 WHERE id='$id'");
            $stmt->bindValue(':nome', $_POST['nome_prof'], PDO::PARAM_STR);
            $stmt->bindValue(':sobrenome', $_POST['sobrenome_prof'], PDO::PARAM_STR);
            $stmt->bindValue(':telefone', $_POST['telefone_prof'], PDO::PARAM_STR);
            $stmt->bindValue(':email', $_POST['email_prof'], PDO::PARAM_STR);
            $stmt->bindValue(':idioma', $_POST['idioma'], PDO::PARAM_INT);
            $stmt->bindValue(':usuario', $_POST['usuario_prof'], PDO::PARAM_STR);
            $stmt->bindValue(':senha', $_POST['senha_prof'], PDO::PARAM_STR);
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
        $stmt = $conn->prepare("SELECT professor.* , idiomas.nome_idioma FROM professor INNER JOIN idiomas ON (professor.idioma = idiomas.id) ORDER BY nome_prof ASC");
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
    
    function getIdiomas() {
        $conn = $this->db->connectionDB();
        $stmt = $conn->prepare("SELECT * FROM idiomas");
        $stmt->execute();
        $resultsIdiomas = $stmt->fetchall(PDO::FETCH_ASSOC);
        $conn = null;
        
        return $resultsIdiomas;
    }

}
