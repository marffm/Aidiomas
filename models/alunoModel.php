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

    function getGrupo($codigo) {
        try {
            $conn = $this->db->connectionDB();
            $stmt = $conn->prepare("SELECT aluno_grupo.*, grupo.level_grupo, idiomas.nome_idioma, professor.nome_prof, professor.sobrenome_prof FROM aluno_grupo INNER JOIN grupo ON (aluno_grupo.cod_grupo=grupo.cod_grupo) INNER JOIN idiomas ON (grupo.idioma=idiomas.id) INNER JOIN professor ON (grupo.codigo_professor=professor.id) WHERE aluno_grupo.codigo_aluno=" . $codigo);
            $stmt->execute();
            $aluno_grupo = $stmt->fetchall(PDO::FETCH_ASSOC);

            if (!array_key_exists(0, $aluno_grupo)) {
                $aluno_grupo = null;
            }

            $conn = null;
            return $aluno_grupo;
        } catch (Exception $ex) {
            echo 'Error: ' . $ex->getMessage();
        }
    }

    function insertBoletim() {
        try {
            $model = $_POST['b_level'];
            $conn = $this->db->connectionDB();
            
            $stmt = $conn->prepare("SELECT * FROM aluno_boletins WHERE codigo_aluno_AB=" . $_SESSION['alunocodigo']);
            $stmt->execute();
            $valueAB = $stmt->fetchall(PDO::FETCH_ASSOC);

            if (!isset($valueAB[0])) {
                switch ($model) {
                    case "b1-e":
                        $stmt = $conn->prepare("INSERT INTO espanhol_b1 (b_level, codigo_aluno, semestre, unidade123, unidade456, unidade789, unidade101112, proyectolectura, mediafinal) VALUES (:b_level, :codigo_aluno, :semestre, :unidade123, :unidade456, :unidade789, :unidade101112, :proyectolectura, :mediafinal)");
                        $stmt->bindValue(':b_level', 'b1-e', PDO::PARAM_STR);
                        $stmt->bindValue(':codigo_aluno', $_POST['codigo_aluno'], PDO::PARAM_INT);
                        $stmt->bindValue(':semestre', $_POST['semestre'], PDO::PARAM_STR);
                        $stmt->bindValue(':unidade123', $_POST['unidade123'], PDO::PARAM_INT);
                        $stmt->bindValue(':unidade456', $_POST['unidade456'], PDO::PARAM_INT);
                        $stmt->bindValue(':unidade789', $_POST['unidade789'], PDO::PARAM_INT);
                        $stmt->bindValue(':unidade101112', $_POST['unidade101112'], PDO::PARAM_INT);
                        $stmt->bindValue(':proyectolectura', $_POST['proyectolectura'], PDO::PARAM_INT);
                        $stmt->bindValue(':mediafinal', $_POST['mediafinal'], PDO::PARAM_INT);
                        $stmt->execute();
                        break;
                    case "b2-e":
                        $stmt = $conn->prepare("INSERT INTO espanhol_b2 (b_level, codigo_aluno, semestre, unidade12345, unidade678910, proyectolectura, mediafinal) VALUES (:b_level, :codigo_aluno, :semestre, :unidade12345, :unidade678910, :proyectolectura, :mediafinal)");
                        $stmt->bindValue(':b_level', 'b2-e', PDO::PARAM_STR);
                        $stmt->bindValue(':codigo_aluno', $_POST['codigo_aluno'], PDO::PARAM_INT);
                        $stmt->bindValue(':semestre', $_POST['semestre'], PDO::PARAM_STR);
                        $stmt->bindValue(':unidade12345', $_POST['unidade12345'], PDO::PARAM_INT);
                        $stmt->bindValue(':unidade678910', $_POST['unidade678910'], PDO::PARAM_INT);
                        $stmt->bindValue(':proyectolectura', $_POST['proyectolectura'], PDO::PARAM_INT);
                        $stmt->bindValue(':mediafinal', $_POST['mediafinal'], PDO::PARAM_INT);
                        $stmt->execute();
                        break;
                }

                $stmt = $conn->prepare("INSERT INTO aluno_boletins (boletins_AB, codigo_aluno_AB) VALUES (:b_level, :codigo_aluno)");
                $stmt->bindValue(':b_level', $_POST['b_level'], PDO::PARAM_STR);
                $stmt->bindValue(':codigo_aluno', $_POST['codigo_aluno'], PDO::PARAM_INT);
                $stmt->execute();
            } else {
                $_SESSION['error_insertBoletim'] = true;
            }

            $conn = null;
        } catch (Exception $ex) {
            echo 'Error: ' . $ex->getMessage();
        }
    }

    function getBoletins($codigoAluno) {
        try {
            $conn = $this->db->connectionDB();
            $stmt = $conn->prepare("SELECT aluno_boletins.codigo_aluno_AB, boletins.nome_boletim FROM aluno_boletins INNER JOIN boletins ON (aluno_boletins.boletins_AB=boletins.boletins) WHERE codigo_aluno_AB=" . $codigoAluno);
            $stmt->execute();
            $listBoletins = $stmt->fetchall(PDO::FETCH_ASSOC);

            if (array_key_exists(0, $listBoletins)) {
                foreach ($listBoletins as $boletins) {
                    $stmt = $conn->prepare("SELECT * FROM " . $boletins['nome_boletim'] . " WHERE codigo_aluno=" . $codigoAluno);
                    $stmt->execute();
                    $listAllBoletins[] = $stmt->fetchall(PDO::FETCH_ASSOC);
                }
            } else {
                $listAllBoletins = null;
            }


            $conn = null;
            return $listAllBoletins;
        } catch (Exception $ex) {
            echo 'Error: ' . $ex->getMessage();
        }
    }

}
