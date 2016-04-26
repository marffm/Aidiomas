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

            $stmt = $conn->prepare("SELECT boletins_AB FROM aluno_boletins WHERE codigo_aluno_AB=" . $_SESSION['alunocodigo']);
            $stmt->execute();
            $valueAB = $stmt->fetchall(PDO::FETCH_ASSOC);

            $check = true;
            foreach ($valueAB as $value) {
                if (in_array($model, $value)) {
                    $check = false;
                }
            }

            if ($check == false) {
                $_SESSION['error_insertBoletim'] = true;
            } else {

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
                    case "a1-e":
                        $stmt = $conn->prepare("INSERT INTO espanhol_a1 (b_level, codigo_aluno, semestre, unidade123, unidade456, unidade789, mediafinal) VALUES (:b_level, :codigo_aluno, :semestre, :unidade123, :unidade456, :unidade789, :mediafinal)");
                        $stmt->bindValue(':b_level', 'a1-e', PDO::PARAM_STR);
                        $stmt->bindValue(':codigo_aluno', $_POST['codigo_aluno'], PDO::PARAM_INT);
                        $stmt->bindValue(':semestre', $_POST['semestre'], PDO::PARAM_STR);
                        $stmt->bindValue(':unidade123', $_POST['unidade123'], PDO::PARAM_INT);
                        $stmt->bindValue(':unidade456', $_POST['unidade456'], PDO::PARAM_INT);
                        $stmt->bindValue(':unidade789', $_POST['unidade789'], PDO::PARAM_INT);
                        $stmt->bindValue(':mediafinal', $_POST['mediafinal'], PDO::PARAM_INT);
                        $stmt->execute();
                        break;
                    case "a2-e":
                        $stmt = $conn->prepare("INSERT INTO espanhol_a2 (b_level, codigo_aluno, semestre, unidade123, unidade456, unidade78910, proyectolectura, mediafinal) VALUES (:b_level, :codigo_aluno, :semestre, :unidade123, :unidade456, :unidade78910, :proyectolectura, :mediafinal)");
                        $stmt->bindValue(':b_level', 'a2-e', PDO::PARAM_STR);
                        $stmt->bindValue(':codigo_aluno', $_POST['codigo_aluno'], PDO::PARAM_INT);
                        $stmt->bindValue(':semestre', $_POST['semestre'], PDO::PARAM_STR);
                        $stmt->bindValue(':unidade123', $_POST['unidade123'], PDO::PARAM_INT);
                        $stmt->bindValue(':unidade456', $_POST['unidade456'], PDO::PARAM_INT);
                        $stmt->bindValue(':unidade78910', $_POST['unidade78910'], PDO::PARAM_INT);
                        $stmt->bindValue(':proyectolectura', $_POST['proyectolectura'], PDO::PARAM_INT);
                        $stmt->bindValue(':mediafinal', $_POST['mediafinal'], PDO::PARAM_INT);
                        $stmt->execute();
                        break;
                    case "alemao":
                        $stmt = $conn->prepare("INSERT INTO alemao (b_level, codigo_aluno, semestre, quiz_1, test_1, quiz_2, test_2, sprechen, hausau) VALUES (:b_level, :codigo_aluno, :semestre, :quiz_1, :test_1, :quiz_2, :test_2, :sprechen, :hausau)");
                        $stmt->bindValue(':b_level', 'alemao', PDO::PARAM_STR);
                        $stmt->bindValue(':codigo_aluno', $_POST['codigo_aluno'], PDO::PARAM_INT);
                        $stmt->bindValue(':semestre', $_POST['semestre'], PDO::PARAM_STR);
                        $stmt->bindValue(':quiz_1', $_POST['quiz_1'], PDO::PARAM_INT);
                        $stmt->bindValue(':test_1', $_POST['test_1'], PDO::PARAM_INT);
                        $stmt->bindValue(':quiz_2', $_POST['quiz_2'], PDO::PARAM_INT);
                        $stmt->bindValue(':test_2', $_POST['test_2'], PDO::PARAM_INT);
                        $stmt->bindValue(':sprechen', $_POST['sprechen'], PDO::PARAM_INT);
                        $stmt->bindValue(':hausau', $_POST['hausau'], PDO::PARAM_INT);
                        $stmt->execute();
                        break;
                    case "ingles":
                        $stmt = $conn->prepare("INSERT INTO ingles (b_level, codigo_aluno, semestre, quiz_1, test_1, participacao_1, media_1, quiz_2, test_2, oral_test, mocks, reading, participacao_2, multroom, media_2, media_final) VALUES (:b_level, :codigo_aluno, :semestre, :quiz_1, :test_1, :participacao_1, :media_1, :quiz_2, :test_2, :oral_test, :mocks, :reading, :participacao_2, :multroom, :media_2, :media_final)");
                        $stmt->bindValue(':b_level', 'ingles', PDO::PARAM_STR);
                        $stmt->bindValue(':codigo_aluno', $_POST['codigo_aluno'], PDO::PARAM_INT);
                        $stmt->bindValue(':semestre', $_POST['semestre'], PDO::PARAM_STR);
                        $stmt->bindValue(':quiz_1', $_POST['quiz_1'], PDO::PARAM_INT);
                        $stmt->bindValue(':test_1', $_POST['test_1'], PDO::PARAM_INT);
                        $stmt->bindValue(':participacao_1', $_POST['participacao_1'], PDO::PARAM_INT);
                        $stmt->bindValue(':media_1', $_POST['media_1'], PDO::PARAM_INT);
                        $stmt->bindValue(':quiz_2', $_POST['quiz_2'], PDO::PARAM_INT);
                        $stmt->bindValue(':test_2', $_POST['test_2'], PDO::PARAM_INT);
                        $stmt->bindValue(':oral_test', $_POST['oral_test'], PDO::PARAM_INT);
                        $stmt->bindValue(':mocks', $_POST['mocks'], PDO::PARAM_INT);
                        $stmt->bindValue(':reading', $_POST['reading'], PDO::PARAM_INT);
                        $stmt->bindValue(':participacao_2', $_POST['participacao_2'], PDO::PARAM_INT);
                        $stmt->bindValue(':multroom', $_POST['multroom'], PDO::PARAM_INT);
                        $stmt->bindValue(':media_2', $_POST['media_2'], PDO::PARAM_INT);
                        $stmt->bindValue(':media_final', $_POST['media_final'], PDO::PARAM_INT);
                        $stmt->execute();
                        break;
                    case "frances":
                        $stmt = $conn->prepare("INSERT INTO frances (b_level, codigo_aluno, semestre)");
                        break;
                }

                $stmt = $conn->prepare("INSERT INTO aluno_boletins (boletins_AB, codigo_aluno_AB) VALUES (:b_level, :codigo_aluno)");
                $stmt->bindValue(':b_level', $_POST['b_level'], PDO::PARAM_STR);
                $stmt->bindValue(':codigo_aluno', $_POST['codigo_aluno'], PDO::PARAM_INT);
                $stmt->execute();
            }

            $conn = null;
        } catch (Exception $ex) {
            echo 'Error: ' . $ex->getMessage();
        }
    }

    function getBoletins($codigoAluno) {
        try {
            $conn = $this->db->connectionDB();
            $stmt = $conn->prepare("SELECT aluno_grupo.*, boletins.nome_boletim, professor.nome_prof FROM aluno_grupo INNER JOIN grupo ON (aluno_grupo.cod_grupo=grupo.cod_grupo) INNER JOIN professor ON (grupo.codigo_professor=professor.id) INNER JOIN boletins ON (grupo.level_grupo=boletins.boletins) WHERE aluno_grupo.codigo_aluno=" . $codigoAluno);
            $stmt->execute();
            $listBoletins = $stmt->fetchall(PDO::FETCH_ASSOC);

            if ($_SESSION['usercategory'] == 'admin') {                
                if (array_key_exists(0, $listBoletins)) {
                    foreach ($listBoletins as $boletins) {
                        $stmt = $conn->prepare("SELECT * FROM " . $boletins['nome_boletim'] . " WHERE codigo_aluno=" . $codigoAluno);
                        $stmt->execute();
                        $listAllBoletins[] = $stmt->fetchall(PDO::FETCH_ASSOC);
                    }
                } else {
                    $listAllBoletins = null;
                }                
            } else if ($_SESSION['usercategory'] == 'areaProfessor') {                
                if (array_key_exists(0, $listBoletins)) {
                    foreach ($listBoletins as $key => $boletins) {
                        if ($boletins['nome_prof'] == $_SESSION['username']) {
                            $stmt = $conn->prepare("SELECT * FROM " . $boletins['nome_boletim'] . " WHERE codigo_aluno=" . $codigoAluno);
                            $stmt->execute();
                            $listAllBoletins[] = $stmt->fetchall(PDO::FETCH_ASSOC);
                        }
                    }
                } else {
                    $listAllBoletins = null;
                }
            } else if ($_SESSION['usercategory'] == 'areaAluno') {
                if (array_key_exists(0, $listBoletins)) {
                    foreach ($listBoletins as $key => $boletins) {
                        
                            $stmt = $conn->prepare("SELECT * FROM " . $boletins['nome_boletim'] . " WHERE codigo_aluno=" . $codigoAluno);
                            $stmt->execute();
                            $listAllBoletins[] = $stmt->fetchall(PDO::FETCH_ASSOC);
                        
                    }
                } else {
                    $listAllBoletins = null;
                }
            }


            $conn = null;
            return $listAllBoletins;
        } catch (Exception $ex) {
            echo 'Error: ' . $ex->getMessage();
        }
    }

    function updateBoletim() {
        try {
            $boletim = $_POST['b_level'];
            $conn = $this->db->connectionDB();

            switch ($boletim) {
                case "b1-e":
                    $stmt = $conn->prepare("UPDATE espanhol_b1 SET b_level=:b_level, codigo_aluno=:codigo_aluno, semestre=:semestre, unidade123=:unidade123, unidade456=:unidade456, unidade789=:unidade789, unidade101112=:unidade101112, proyectolectura=:proyectolectura, mediafinal=:mediafinal WHERE codigo_aluno=:codigo_aluno AND b_level=:b_level");
                    $stmt->bindValue(':b_level', $_POST['b_level'], PDO::PARAM_STR);
                    $stmt->bindValue(':codigo_aluno', $_POST['codigo_aluno'], PDO::PARAM_INT);
                    $stmt->bindValue(':semestre', $_POST['semestre'], PDO::PARAM_STR);
                    $stmt->bindValue(':unidade123', $_POST['unidade123'], PDO::PARAM_STR);
                    $stmt->bindValue(':unidade456', $_POST['unidade456'], PDO::PARAM_STR);
                    $stmt->bindValue(':unidade789', $_POST['unidade789'], PDO::PARAM_STR);
                    $stmt->bindValue(':unidade101112', $_POST['unidade101112'], PDO::PARAM_STR);
                    $stmt->bindValue(':proyectolectura', $_POST['proyectolectura'], PDO::PARAM_STR);
                    $stmt->bindValue(':mediafinal', $_POST['mediafinal'], PDO::PARAM_STR);
                    $stmt->execute();
                    break;
                case "b2-e":
                    $stmt = $conn->prepare("UPDATE espanhol_b2 SET b_level=:b_level, codigo_aluno=:codigo_aluno, semestre=:semestre, unidade12345=:unidade12345, unidade678910=:unidade678910, proyectolectura=:proyectolectura, mediafinal=:mediafinal WHERE codigo_aluno=:codigo_aluno AND b_level=:b_level");
                    $stmt->bindValue(':b_level', $_POST['b_level'], PDO::PARAM_STR);
                    $stmt->bindValue(':codigo_aluno', $_POST['codigo_aluno'], PDO::PARAM_INT);
                    $stmt->bindValue(':semestre', $_POST['semestre'], PDO::PARAM_STR);
                    $stmt->bindValue(':unidade12345', $_POST['unidade12345'], PDO::PARAM_STR);
                    $stmt->bindValue(':unidade678910', $_POST['unidade678910'], PDO::PARAM_STR);
                    $stmt->bindValue(':proyectolectura', $_POST['proyectolectura'], PDO::PARAM_STR);
                    $stmt->bindValue(':mediafinal', $_POST['mediafinal'], PDO::PARAM_STR);
                    $stmt->execute();
                    break;
                case "a1-e":
                    $stmt = $conn->prepare("UPDATE espanhol_a1 SET b_level=:b_level, codigo_aluno=:codigo_aluno, semestre=:semestre, unidade123=:unidade123, unidade456=:unidade456, unidade789=:unidade789, mediafinal=:mediafinal WHERE codigo_aluno=:codigo_aluno AND b_level=:b_level");
                    $stmt->bindValue(':b_level', $_POST['b_level'], PDO::PARAM_STR);
                    $stmt->bindValue(':codigo_aluno', $_POST['codigo_aluno'], PDO::PARAM_INT);
                    $stmt->bindValue(':semestre', $_POST['semestre'], PDO::PARAM_STR);
                    $stmt->bindValue(':unidade123', $_POST['unidade123'], PDO::PARAM_STR);
                    $stmt->bindValue(':unidade456', $_POST['unidade456'], PDO::PARAM_STR);
                    $stmt->bindValue(':unidade789', $_POST['unidade789'], PDO::PARAM_STR);
                    $stmt->bindValue(':mediafinal', $_POST['mediafinal'], PDO::PARAM_STR);
                    $stmt->execute();
                    break;
                case "a2-e":
                    $stmt = $conn->prepare("UPDATE espanhol_a2 SET b_level=:b_level, codigo_aluno=:codigo_aluno, semestre=:semestre, unidade123=:unidade123, unidade456=:unidade456, unidade78910=:unidade78910, proyectolectura=:proyectolectura, mediafinal=:mediafinal WHERE codigo_aluno=:codigo_aluno AND b_level=:b_level");
                    $stmt->bindValue(':b_level', $_POST['b_level'], PDO::PARAM_STR);
                    $stmt->bindValue(':codigo_aluno', $_POST['codigo_aluno'], PDO::PARAM_INT);
                    $stmt->bindValue(':semestre', $_POST['semestre'], PDO::PARAM_STR);
                    $stmt->bindValue(':unidade123', $_POST['unidade123'], PDO::PARAM_STR);
                    $stmt->bindValue(':unidade456', $_POST['unidade456'], PDO::PARAM_STR);
                    $stmt->bindValue(':unidade78910', $_POST['unidade78910'], PDO::PARAM_STR);
                    $stmt->bindValue(':proyectolectura', $_POST['proyectolectura'], PDO::PARAM_STR);
                    $stmt->bindValue(':mediafinal', $_POST['mediafinal'], PDO::PARAM_STR);
                    $stmt->execute();
                    break;
                case "alemao":
                    $stmt = $conn->prepare("UPDATE alemao SET b_level=:b_level, codigo_aluno=:codigo_aluno, semestre=:semestre, quiz_1=:quiz_1, test_1=:test_1, quiz_2=:quiz_2, test_2=:test_2, sprechen=:sprechen, hausau=:hausau WHERE codigo_aluno=:codigo_aluno AND b_level=:b_level");
                    $stmt->bindValue(':b_level', $_POST['b_level'], PDO::PARAM_STR);
                    $stmt->bindValue(':codigo_aluno', $_POST['codigo_aluno'], PDO::PARAM_INT);
                    $stmt->bindValue(':semestre', $_POST['semestre'], PDO::PARAM_STR);
                    $stmt->bindValue(':quiz_1', $_POST['quiz_1'], PDO::PARAM_STR);
                    $stmt->bindValue(':test_1', $_POST['test_1'], PDO::PARAM_STR);
                    $stmt->bindValue(':quiz_2', $_POST['quiz_2'], PDO::PARAM_STR);
                    $stmt->bindValue(':test_2', $_POST['test_2'], PDO::PARAM_STR);
                    $stmt->bindValue(':sprechen', $_POST['sprechen'], PDO::PARAM_STR);
                    $stmt->bindValue(':hausau', $_POST['hausau'], PDO::PARAM_STR);
                    $stmt->execute();
                    break;
                case "ingles":
                    $stmt = $conn->prepare("UPDATE ingles SET b_level=:b_level, codigo_aluno=:codigo_aluno, semestre=:semestre, quiz_1=:quiz_1, test_1=:test_1, participacao_1=:participacao_1, media_1=:media_1, quiz_2=:quiz_2, test_2=:test_2, oral_test=:oral_test, mocks=:mocks, reading=:reading, participacao_2=:participacao_2, multroom=:multroom, media_2=:media_2, media_final=:media_final WHERE codigo_aluno=:codigo_aluno AND b_level=:b_level");
                    $stmt->bindValue(':b_level', $_POST['b_level'], PDO::PARAM_STR);
                    $stmt->bindValue(':codigo_aluno', $_POST['codigo_aluno'], PDO::PARAM_INT);
                    $stmt->bindValue(':semestre', $_POST['semestre'], PDO::PARAM_STR);
                    $stmt->bindValue(':quiz_1', $_POST['quiz_1'], PDO::PARAM_STR);
                    $stmt->bindValue(':test_1', $_POST['test_1'], PDO::PARAM_STR);
                    $stmt->bindValue(':participacao_1', $_POST['participacao_1'], PDO::PARAM_STR);
                    $stmt->bindValue(':media_1', $_POST['media_1'], PDO::PARAM_STR);
                    $stmt->bindValue(':quiz_2', $_POST['quiz_2'], PDO::PARAM_STR);
                    $stmt->bindValue(':test_2', $_POST['test_2'], PDO::PARAM_STR);
                    $stmt->bindValue(':oral_test', $_POST['oral_test'], PDO::PARAM_STR);
                    $stmt->bindValue(':mocks', $_POST['mocks'], PDO::PARAM_STR);
                    $stmt->bindValue(':reading', $_POST['reading'], PDO::PARAM_STR);
                    $stmt->bindValue(':participacao_2', $_POST['participacao_2'], PDO::PARAM_STR);
                    $stmt->bindValue(':multroom', $_POST['multroom'], PDO::PARAM_STR);
                    $stmt->bindValue(':media_2', $_POST['media_2'], PDO::PARAM_STR);
                    $stmt->bindValue(':media_final', $_POST['media_final'], PDO::PARAM_STR);
                    $stmt->execute();
                    break;
                case "frances":
                    
                    break;
            }

            $conn = null;
        } catch (Exception $ex) {

            echo 'Error: ' . $ex->getMessage();
        }
    }

    function deleteBoletim($id) {
        $boletim = explode("_", $id);
        try {
            $conn = $this->db->connectionDB();


            switch ($boletim[1]) {
                case "b1-e" :
                    $stmt = $conn->prepare("DELETE FROM espanhol_b1 WHERE codigo_aluno=" . $boletim[0]);
                    $stmt->execute();
                    break;
                case "b2-e" :
                    $stmt = $conn->prepare("DELETE FROM espanhol_b2 WHERE codigo_aluno=" . $boletim[0]);
                    $stmt->execute();
                    break;
                case "a1-e":
                    $stmt = $conn->prepare("DELETE FROM espanhol_a1 WHERE codigo_aluno=" . $boletim[0]);
                    $stmt->execute();
                    break;
                case "a2-e":
                    $stmt = $conn->prepare("DELETE FROM espanhol_a2 WHERE codigo_aluno=" . $boletim[0]);
                    $stmt->execute();
                    break;
                case "alemao":
                    $stmt = $conn->prepare("DELETE FROM alemao WHERE codigo_aluno=" . $boletim[0]);
                    $stmt->execute();
                    break;
                case "ingles":
                    $stmt = $conn->prepare("DELETE FROM ingles WHERE codigo_aluno=" . $boletim[0]);
                    $stmt->execute();
                    break;
                case "frances":
                    $stmt = $conn->prepare("DELETE FROM frances WHERE codigo_aluno=" . $boletim[0]);
                    $stmt->execute();
                    break;
            }
            $stmt = $conn->prepare("DELETE FROM aluno_boletins WHERE aluno_boletins.boletins_AB='$boletim[1]' AND aluno_boletins.codigo_aluno_AB=" . $boletim[0]);
            $stmt->execute();
            $conn = null;
        } catch (Exception $ex) {
            echo 'Error: ' . $ex->getMessage();
        }
    }
    
    function checkBoletim() {
        try {
            $conn = $this->db->connectionDB();
            $stmt = $conn->prepare("SELECT boletins_AB FROM aluno_boletins WHERE codigo_aluno_AB=" . $_SESSION['alunocodigo']);
            $stmt->execute();
            $check = $stmt->fetchAll(PDO::FETCH_ASSOC);
            
            $conn = null;
            return $check;
        } catch (Exception $ex) {
            echo 'Error: ' . $ex->getMessage();
        }
    }
    
    function getRecados($id) {
        try {
            $conn = $this->db->connectionDB();
            $stmt = $conn->prepare("SELECT recado_grupo.*, aluno_grupo.codigo_aluno FROM recado_grupo INNER JOIN aluno_grupo ON (recado_grupo.cod_grupo=aluno_grupo.cod_grupo) WHERE aluno_grupo.codigo_aluno=" . $id);
            $stmt->execute();
            $recadosGrupo = $stmt->fetchall(PDO::FETCH_ASSOC);
            $conn = null;
            return $recadosGrupo;
            
        } catch (Exception $ex) {
            echo 'Error: ' . $ex->getMessage();
        }
    }
}
