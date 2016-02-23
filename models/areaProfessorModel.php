<?php

class areaProfessorModel extends Model {
    
    function getGrupos($username) {
        try {
            $conn = $this->db->connectionDB();
            $stmt = $conn->prepare("SELECT grupo.cod_grupo, professor.nome_prof FROM grupo INNER JOIN professor ON (grupo.codigo_professor=professor.id) WHERE professor.nome_prof='$username'");
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
    
}