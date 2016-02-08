<?php

class cadastroAlunoModel extends Model {

    function insertAluno() {
        try {
            $conn = $this->db->connectionDB();
            $stmt = $conn->prepare("INSERT INTO aluno (codigo, nome, sobrenome, nascimento, telefone, email, usuario, senha, nivel) VALUES (:codigo, :nome, :sobrenome, :nascimento, :telefone, :email, :usuario, :senha, :nivel) ");
            $stmt->bindValue(':codigo', (int)$_POST['codigo'], PDO::PARAM_INT);
            $stmt->bindValue(':nome', $_POST['nome'], PDO::PARAM_STR);
            $stmt->bindValue(':sobrenome', $_POST['sobrenome'], PDO::PARAM_STR);
            $stmt->bindValue(':nascimento', $_POST['nascimento'], PDO::PARAM_STR);
            $stmt->bindValue(':telefone', $_POST['telefone'], PDO::PARAM_STR);
            $stmt->bindValue(':email', $_POST['email'], PDO::PARAM_STR);
            $stmt->bindValue(':usuario', $_POST['usuario'], PDO::PARAM_STR);
            $stmt->bindValue(':senha', $_POST['senha'], PDO::PARAM_STR);
            $stmt->bindValue(':nivel', 3, PDO::PARAM_STR);
            $stmt->execute();
            $conn = null;
            
        } catch (Exception $ex) {
            echo 'Error: ' . $ex->getMessage();
        }
    }
    
    function checkAluno() {
        try {
            $conn = $this->db->connectionDB();
            $stmt = $conn->prepare("SELECT codigo FROM aluno WHERE codigo=:codigo");
            $stmt->bindValue(':codigo', (int)$_POST['codigo'], PDO::PARAM_INT);
            $stmt->execute();
            $results = $stmt->fetchall(PDO::FETCH_ASSOC);
            
            if ($results) {
                $validate = false;
            } else {
                $validate = true;
            } 
            
            $conn = null;
            return $validate;
            
        } catch (Exception $ex) {
            echo 'Error: ' . $ex->getMessage();
        }
    }

}
