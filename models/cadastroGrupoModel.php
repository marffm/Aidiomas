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
            $stmt = $conn->prepare("INSERT INTO grupo (cod_grupo, idioma, level_grupo, codigo_professor) VALUES (:cod_grupo, :idioma, :level_grupo, :codigo_professor)");
            $stmt->bindValue(':cod_grupo', $_POST['cod_grupo'], PDO::PARAM_INT);
            $stmt->bindValue(':idioma', $_POST['idioma'], PDO::PARAM_INT);
            $stmt->bindValue(':level_grupo', $_POST['level_grupo'], PDO::PARAM_STR);
            $stmt->bindValue(':codigo_professor', $_POST['codigo_professor'], PDO::PARAM_INT);
            $stmt->execute();
            $conn = null;
            
        } catch (Exception $ex) {
            echo 'Error: ' . $ex->getMessage();
        }
    }
    
    
    function getGrupos() {
        try {
            $conn = $this->db->connectionDB();
            $stmt = $conn->prepare("SELECT grupo.*, professor.nome_prof, idiomas.nome_idioma FROM grupo INNER JOIN professor ON (grupo.codigo_professor=professor.id) INNER JOIN idiomas ON (grupo.idioma=idiomas.id) ORDER BY grupo.cod_grupo ASC ");
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
    
    function checkInsertAluno_Grupo() {
        try {
            $conn = $this->db->connectionDB();
            $stmt = $conn->prepare("SELECT codigo_aluno FROM aluno_grupo WHERE codigo_aluno=:codigo_aluno AND cod_grupo=:cod_grupo");
            $stmt->bindValue(':codigo_aluno', $_POST['codigo_aluno'], PDO::PARAM_INT);
            $stmt->bindValue(':cod_grupo', $_POST['cod_grupo'], PDO::PARAM_INT);
            $stmt->execute();
            $checkinsert = $stmt->fetchall(PDO::FETCH_ASSOC);
            
            if ($checkinsert) {
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
    
    function insertAluno_Grupo() {
        try {
            $conn = $this->db->connectionDB();
            $stmt = $conn->prepare("INSERT INTO aluno_grupo (cod_grupo, codigo_aluno) VALUES (:cod_grupo, :codigo_aluno)");
            $stmt->bindValue(':cod_grupo', $_POST['cod_grupo'], PDO::PARAM_INT);
            $stmt->bindValue(':codigo_aluno', $_POST['codigo_aluno'], PDO::PARAM_INT);
            $stmt->execute();
            $conn = null;
        } catch (Exception $ex) {
            echo 'Error: ' . $ex->getMessage();
        }
    }
    
    function deleteAluno_Grupo($id) {
        try {
            $conn = $this->db->connectionDB();
            $stmt = $conn->prepare("DELETE FROM aluno_grupo WHERE cod_grupo=:cod_grupo  AND codigo_aluno=:codigo_aluno");
            $stmt->bindValue(':cod_grupo', $id[0], PDO::PARAM_INT);
            $stmt->bindValue(':codigo_aluno', $id[1], PDO::PARAM_INT);
            $stmt->execute();
            $conn = null;
        } catch (Exception $ex) {
            echo 'Error: ' . $ex->getMessage();
        }
    }
    
    function deleteGrupo($id) {
        try {
            $conn = $this->db->connectionDB();
            $stmt = $conn->prepare("DELETE FROM grupo WHERE cod_grupo=:cod_grupo");
            $stmt->bindValue(':cod_grupo', $id, PDO::PARAM_INT);
            $stmt->execute();
            $conn = null;
            
        } catch (Exception $ex) {
            echo 'Error: ' . $ex->getMessage();
        }
    }
    
    function getBoletins() {
        try {
            $conn = $this->db->connectionDB();
            $stmt = $conn->prepare("SELECT * FROM boletins");
            $stmt->execute();
            $boletins = $stmt->fetchall(PDO::FETCH_ASSOC);
            
            return $boletins;
            
        } catch (Exception $ex) {
            echo 'Error: ' . $ex->getMessage();
        }
    }
    
    function updateGrupo() {
        try {
            $conn = $this->db->connectionDB();
            $stmt = $conn->prepare("UPDATE grupo SET cod_grupo=:cod_grupo, idioma=:idioma, codigo_professor=:codigo_professor, level_grupo=:level_grupo WHERE cod_grupo=:cod_grupo");
            $stmt->bindValue(':cod_grupo', $_POST['cod_grupo'], PDO::PARAM_INT);
            $stmt->bindValue(':idioma', $_POST['idioma'], PDO::PARAM_INT);
            $stmt->bindValue(':codigo_professor', $_POST['codigo_professor'], PDO::PARAM_INT);
            $stmt->bindValue(':level_grupo', $_POST['level_grupo'], PDO::PARAM_STR);
            $stmt->execute();
            $conn = null;
        } catch (Exception $ex) {
            echo 'Error: ' . $ex->getMessage();
        }
    }

}
