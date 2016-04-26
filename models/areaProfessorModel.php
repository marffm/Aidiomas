<?php

class areaProfessorModel extends Model {
    
    function getGrupos($username) {
        try {
            $conn = $this->db->connectionDB();
            $stmt = $conn->prepare("SELECT grupo.cod_grupo, professor.nome_prof, idiomas.nome_idioma FROM grupo INNER JOIN professor ON (grupo.codigo_professor=professor.id) INNER JOIN idiomas ON (grupo.idioma=idiomas.id) WHERE professor.nome_prof='$username'");
            $stmt->execute();
            $grupos = $stmt->fetchall(PDO::FETCH_ASSOC);
            $conn = null;
            return $grupos;
        } catch (Exception $ex) {

        }
    }
    
    function getGrupoAlunos($username) {
        try {
            
            $conn = $this->db->connectionDB();
            $stmt = $conn->prepare("SELECT professor.nome_prof, grupo.cod_grupo, grupo.level_grupo, aluno.*  FROM professor INNER JOIN grupo ON (grupo.codigo_professor=professor.id) INNER JOIN aluno_grupo ON (aluno_grupo.cod_grupo=grupo.cod_grupo) INNER JOIN aluno ON (aluno.codigo=aluno_grupo.codigo_aluno) WHERE professor.nome_prof='$username'");
            $stmt->execute();
            $grupos = $stmt->fetchall(PDO::FETCH_ASSOC);
            $conn = null;
            return $grupos;            
        } catch (Exception $ex) {
            echo "Error: " . $ex->getMessage();
        }
    }
    
    function getRecados() {
        try {
            $conn = $this->db->connectionDB();
            $stmt = $conn->prepare("SELECT * FROM recado_grupo");
            $stmt->execute();
            $recadosGrupo = $stmt->fetchall(PDO::FETCH_ASSOC);
            $conn = null;
            return $recadosGrupo;
            
        } catch (Exception $ex) {
            echo 'Error: ' . $ex->getMessage();
        }
    }
    
    function insertRecado($codGrupo) {
        try {
            
            $conn = $this->db->connectionDB();
            $stmt = $conn->prepare("INSERT INTO recado_grupo (cod_grupo, titulo_recado, conteudo_recado, data_recado) VALUES (:cod_grupo, :titulo_recado, :conteudo_recado, :data_recado)");
            $stmt->bindValue(':cod_grupo', $_POST['cod_grupo'], PDO::PARAM_INT);
            $stmt->bindValue(':titulo_recado', $_POST['titulo-recado'], PDO::PARAM_STR);
            $stmt->bindValue(':conteudo_recado', $_POST['conteudo-recado'], PDO::PARAM_STR);
            $stmt->bindValue(':data_recado', $_POST['data-recado'], PDO::PARAM_INT);
            $stmt->execute();
            $conn = null;
            
        } catch (Exception $ex) {
            echo 'Error: ' . $ex->getMessage();
        }
        
    }
    
    function updateRecado($id) {
        try {
            $conn = $this->db->connectionDB();
            $stmt = $conn->prepare("UPDATE recado_grupo SET id=:id, cod_grupo=:cod_grupo, titulo_recado=:titulo_recado, conteudo_recado=:conteudo_recado, data_recado=:data_recado WHERE id=" . $id);
            $stmt->bindValue(':id', $_POST['recado-id'], PDO::PARAM_INT);
            $stmt->bindValue(':cod_grupo', $_POST['cod_grupo'], PDO::PARAM_INT);
            $stmt->bindValue(':titulo_recado', $_POST['titulo-recado'], PDO::PARAM_STR);
            $stmt->bindValue(':conteudo_recado', $_POST['conteudo-recado'], PDO::PARAM_STR);
            $stmt->bindValue(':data_recado', $_POST['data-recado'], PDO::PARAM_INT);
            $stmt->execute();
            $conn = null;
            
        } catch (Exception $ex) {
            echo 'Error: ' . $ex->getMessage();
        }
    }
    
    function deleteRecado($id) {
        try {
            $conn = $this->db->connectionDB();
            $stmt = $conn->prepare("DELETE FROM recado_grupo WHERE id=" . $id);
            $stmt->execute();
            $conn = null;
            
        } catch (Exception $ex) {
            echo 'Error: ' . $ex->getMessage();
        }
    }
    
}