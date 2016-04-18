<?php

class Aluno extends Controller {

    function index() {
        $data = array();
        $data['username'] = $_SESSION['username'];
        $data['usercategory'] = $_SESSION['usercategory'];

        if (!isset($data['username']) and ! isset($data['usercategory'])) {
            header("Location:" . PATH_URL . 'login');
        }

        if ($data['usercategory'] != 'admin' and $data['usercategory'] != "areaProfessor") {
            header("Location:" . PATH_URL . 'error');
        }

        $this->loader->loadModel('alunoModel');

        $url = $this->url->getUrl();
        
        if (isset($url[2])) {
            $_SESSION['alunocodigo'] = $url[2];
            $data['aluno'] = $this->alunoModel->setAluno($_SESSION['alunocodigo']);
        } else if (isset($_SESSION['alunocodigo'])) {
            $data['aluno'] = $this->alunoModel->setAluno($_SESSION['alunocodigo']);
        } else {
            header("Location:" . PATH_URL . 'admin');
        }
        list($aluno) = $data['aluno'];

        if (isset($url[1]) and ! isset($url[2])) {
            header("Location:" . PATH_URL . 'aluno');
        }
        
        if (isset($url[1]) and $url[1] == 'deleteBoletim') {
            header("Location:" . PATH_URL . 'admin');
        } else if (isset ($url[1]) and $url[1] == 'deleteAluno') {
            header("Location:" . PATH_URL . 'admin');
        }

        $this->document->setTitle('Aluno');
        $this->loader->Load('head');

        $data['aluno_grupo'] = $this->alunoModel->getGrupo($_SESSION['alunocodigo']);
        $data['aluno_boletin'] = $this->alunoModel->getBoletins($_SESSION['alunocodigo']);

                
        if ($data['usercategory'] == 'admin') {
            $title = 'Administrador';
            $link = 'admin';
            $data['textArea'] = 'Área Administrativa';           
        } else {
            $title = 'Professor';
            $link = 'areaProfessor';
            $data['textArea'] = 'Área do Professor';
        }

        $this->breadcrumbs->setBreadcrumbs('Aluno', 'aluno/setAluno/' . $aluno['codigo'], $title, $link);
        $breadcrumbs = $this->breadcrumbs->getBreadcrumbs();
        
        
        //print_r($test1);

        if (isset($data['aluno_grupo'])) {
            $check = $this->alunoModel->checkBoletim($_SESSION['alunocodigo']);
            foreach ($data['aluno_grupo'] as $aluno_grupo) {
                switch ($aluno_grupo['level_grupo']) {
                    case "b1-e":
                        foreach ($check as $values) {
                            foreach ($values as $value) {
                                if ($value == 'b1-e'){
                                    $hasBoletim = 'true';
                                } else {
                                    $hasBoletim = null;
                                }
                            }
                        }
                        if ($aluno_grupo['nome_prof'] == $_SESSION['username'] and isset($hasBoletim)) {
                         $nivel_b1e = true;   
                        } else if ($_SESSION['usercategory'] == 'admin') {
                          $nivel_b1e = true;  
                        }                        
                        break;
                    case "b2-e":
                        foreach ($check as $values) {
                            foreach ($values as $value) {
                                if ($value == 'b2-e'){
                                    $hasBoletim = 'true';
                                } else {
                                    $hasBoletim = null;
                                }
                            }
                        }
                        if ($aluno_grupo['nome_prof'] == $_SESSION['username'] and isset($hasBoletim)) {
                         $nivel_b2e = true;   
                        } else if ($_SESSION['usercategory'] == 'admin') {
                          $nivel_b2e = true;  
                        }     
                        break;
                    case "a1-e":
                        if ($aluno_grupo['nome_prof'] == $_SESSION['username']) {
                         $nivel_a1e = true;   
                        } else if ($_SESSION['usercategory'] == 'admin') {
                          $nivel_a1e = true;  
                        }
                        break;
                    case "a2-e":
                        if ($aluno_grupo['nome_prof'] == $_SESSION['username']) {
                         $nivel_a2e = true;   
                        } else if ($_SESSION['usercategory'] == 'admin') {
                          $nivel_a2e = true;  
                        }
                        break;
                    case "alemao":
                        if ($aluno_grupo['nome_prof'] == $_SESSION['username']) {
                         $nivel_alemao = true;   
                        } else if ($_SESSION['usercategory'] == 'admin') {
                          $nivel_alemao = true;  
                        }
                        break;
                    case "ingles":
                        if ($aluno_grupo['nome_prof'] == $_SESSION['username']) {
                         $nivel_ingles = true;   
                        } else if ($_SESSION['usercategory'] == 'admin') {
                          $nivel_ingles = true;  
                        }
                        break;
                }
            }
        }
        
        print_r($hasBoletim);

        if (isset($_SESSION['error_insertBoletim'])){
            $errorInsertBoletim = 'Boletim ja Adicionado';
            $_SESSION['error_insertBoletim'] = null;
            
        }

        $data['username'] = $_SESSION['username'];
        $data['destroy'] = PATH_URL . 'sessions/destroy';

        $data['filename'] = 'views/admin/aluno.tpl';
        if (file_exists($data['filename'])) {
            require_once 'views/admin/aluno.tpl';
        }
        $this->loader->Load('footer');
    }

    function setAluno($codigo) {
        if (isset($_SESSION['alunocodigo'])) {
            $aluno = $this->alunoModel->setAluno($_SESSION['alunocodigo']);
        } else {
            $aluno = $this->alunoModel->setAluno($codigo);
        }
    }

    function updateAluno() {
        if (isset($_SESSION['alunocodigo'])) {
            $this->alunoModel->updateAluno();
        }
    }

    function deleteAluno($codigo) {
        $this->alunoModel->deleteAluno($codigo);
        $_SESSION['alunocodigo'] = null;
    }

    function insertboletim() {
        $this->alunoModel->insertBoletim();
    }
    
    function updateBoletim() {
        $this->alunoModel->updateBoletim();
    }
    
    function deleteBoletim($id) {
        $this->alunoModel->deleteBoletim($id);
    }

}
