<?php

class cadastroGrupoModel extends Model {
    
    function getGrupo() {
        try {
            $conn = $this->db->connectionDB();
            $stmt = $conn->prepare("SELECT * FROM grupos");
            $stmt->execute();
            $resultsGrupos = $stmt->fetchall(PDO::FETCH_ASSOC);
            $conn = null;

            return $resultsGrupos;
        } catch (Exception $ex) {
            echo 'Error: ' . $ex->getMessage();
        }
    }

    function getIdiomas() {
        try {
            $conn = $this->db->connectionDB();
            $stmt = $conn->prepare("SELECT * FROM idiomas");
            $stmt->execute();
            $resultsIdiomas = $stmt->fetchall(PDO::FETCH_ASSOC);
            $conn = null;

            return $resultsIdiomas;
        } catch (Exception $ex) {
            echo 'Error: ' . $ex->getMessage();
        }
    }
    
    function getAlunos() {
        try {
            
            $conn = $this->db->connectionDB();
            $stmt = $conn->prepare("SELECT nome, sobrenome, codigo FROM aluno");
            $stmt->execute();
            $resultsAlunos = $stmt->fetchall(PDO::FETCH_ASSOC);
            $conn = null;
            
            return $resultsAlunos;
                        
        } catch (Exception $ex) {
            echo 'Error: ' . $ex->getMessage();
        }
    }

    function getProfessores() {
        try {
            $conn = $this->db->connectionDB();
            $stmt = $conn->prepare("SELECT nome_prof, id FROM professor");
            $stmt->execute();
            $resultsProfessores = $stmt->fetchall(PDO::FETCH_ASSOC);
            $conn = null;

            return $resultsProfessores;
        } catch (Exception $ex) {
            echo 'Error: ' . $ex->getMessage();
        }
    }

    function checkGrupo() {

        try {
            $conn = $this->db->connectionDB();
            $stmt = $conn->prepare("SELECT cod_grupo FROM grupo WHERE cod_grupo=" . $_POST['cod_grupo']);
            $stmt->execute();
            $checkgrupo = $stmt->fetchall(PDO::FETCH_ASSOC);
            
            if ($checkgrupo) {
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

    function insertGrupo() {
        try {            
            $conn = $this->db->connectionDB();
            $stmt = $conn->prepare("INSERT INTO grupo (cod_grupo, idioma, level_grupo, semestre, codigo_professor, codigo_aluno) VALUES (:cod_grupo, :idioma, :level_grupo, :semestre, :codigo_professor, :codigo_aluno)");
            $stmt->bindValue(':cod_grupo', $_POST['cod_grupo'], PDO::PARAM_INT);
            $stmt->bindValue(':idioma', $_POST['idioma'], PDO::PARAM_INT);
            $stmt->bindValue(':level_grupo', $_POST['level_grupo'], PDO::PARAM_STR);
            $stmt->bindValue(':semestre', $_POST['semestre'], PDO::PARAM_STR);
            $stmt->bindValue(':codigo_professor', $_POST['codigo_professor'], PDO::PARAM_INT);
            $stmt->bindValue(':codigo_aluno', $_POST['codigo_aluno'], PDO::PARAM_INT);
            $stmt->execute();
            $conn = null;
            
        } catch (Exception $ex) {
            echo 'Error: ' . $ex->getMessage();
        }
    }
    
    
    function getGrupos() {
        try {
            $conn = $this->db->connectionDB();
            $stmt = $conn->prepare("SELECT grupo.*, aluno.nome, aluno.sobrenome, professor.nome_prof FROM grupo INNER JOIN aluno ON (grupo.codigo_aluno=aluno.codigo) INNER JOIN professor ON (grupo.codigo_professor=professor.id) ORDER BY grupo.cod_grupo ASC ");
            $stmt->execute();
            $resultsGrupo = $stmt->fetchall(PDO::FETCH_ASSOC);
            $conn = null;
            
            return $resultsGrupo;           
            
        } catch (Exception $ex) {
            echo 'Error: ' . $ex->getMessage();
        }
    }
    
    function getAluno_Grupo() {
        try {
            $conn = $this->db->connectionDB();
            $stmt = $conn->prepare("SELECT grupo.cod_grupo, aluno.nome, aluno.sobrenome, aluno.codigo  FROM aluno_grupo INNER JOIN grupo ON (aluno_grupo.cod_grupo=grupo.cod_grupo) INNER JOIN aluno ON (aluno_grupo.codigo_aluno=aluno.codigo)");
            $stmt->execute();
            $resultsAlunoGrupo = $stmt->fetchall(PDO::FETCH_ASSOC);
            $conn = null;
            
            return $resultsAlunoGrupo;           
            
        } catch (Exception $ex) {
            echo 'Error: ' . $ex->getMessage();
        }
    }

}
