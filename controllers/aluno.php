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

        $this->document->setTitle('Aluno');
        $this->loader->Load('head');

        $data['aluno_grupo'] = $this->alunoModel->getGrupo($_SESSION['alunocodigo']);
        $data['aluno_boletin'] = $this->alunoModel->getBoletins($_SESSION['alunocodigo']);



        if ($data['usercategory'] == 'admin') {
            $title = 'Administrador';
            $link = 'admin';
        } else {
            $title = 'Professor';
            $link = 'areaProfessor';
        }

        $this->breadcrumbs->setBreadcrumbs('Aluno', 'aluno/setAluno/' . $aluno['codigo'], $title, $link);
        $breadcrumbs = $this->breadcrumbs->getBreadcrumbs();

        //print_r($data['aluno_grupo']);

        if (isset($data['aluno_grupo'])) {
            foreach ($data['aluno_grupo'] as $aluno_grupo) {
                switch ($aluno_grupo['level_grupo']) {
                    case "b1-e":
                        $nivel_b1e = true;
                        break;
                    case "b2-e":
                        $nivel_b2e = true;
                        break;
                }
            }
        }


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

}
