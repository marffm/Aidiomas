<?php

class alunoModel extends Model {

    function setAluno($codigo) {
        try {
            $conn = $this->db->connectionDB();
            $stmt = $conn->prepare("SELECT * FROM aluno WHERE codigo='$codigo'");
            $stmt->execute();
            $aluno = $stmt->fetchall(PDO::FETCH_ASSOC);
            $conn = null;
            return $aluno;
        } catch (Exception $ex) {
            echo 'Error: ' . $ex->getMessage();
        }
    }

    function updateAluno() {
        try {
            $conn = $this->db->connectionDB();
            $stmt = $conn->prepare("UPDATE aluno SET codigo=:codigo, nome=:nome, sobrenome=:sobrenome, nascimento=:nascimento, telefone=:telefone, email=:email, usuario=:usuario, senha=:senha, nivel=:nivel WHERE codigo=:codigo");
            $stmt->bindValue(':codigo', $_POST['codigo'], PDO::PARAM_INT);
            $stmt->bindValue(':nome', $_POST['nome'], PDO::PARAM_STR);
            $stmt->bindValue(':sobrenome', $_POST['sobrenome'], PDO::PARAM_STR);
            $stmt->bindValue(':nascimento', $_POST['nascimento'], PDO::PARAM_STR);
            $stmt->bindValue(':telefone', $_POST['telefone'], PDO::PARAM_STR);
            $stmt->bindValue(':email', $_POST['email'], PDO::PARAM_STR);
            $stmt->bindValue(':usuario', $_POST['usuario'], PDO::PARAM_STR);
            $stmt->bindValue(':senha', $_POST['senha'], PDO::PARAM_STR);
            $stmt->bindValue(':nivel', $_POST['nivel'], PDO::PARAM_INT);
            $stmt->execute();
            $conn = null;
            
        } catch (Exception $ex) {
            echo 'Error: ' . $ex->getMessage();
        }
    }
    
    function deleteAluno($codigo) {
        try {
            $conn = $this->db->connectionDB();
            $stmt = $conn->prepare("DELETE FROM aluno WHERE codigo=$codigo");
            $stmt->execute();
            $conn = null;
            
        } catch (Exception $ex) {
            echo 'Error: ' . $ex->getMessage();
        }
    }

}
