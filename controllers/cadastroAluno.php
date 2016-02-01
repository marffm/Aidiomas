<?php

class cadastroAluno extends Controller {

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
        $url = $this->url->getUrl();

        if (isset($url[1])) {
            header("Location:" . PATH_URL . 'cadastroAluno');
        }

        $this->document->setTitle('Cadastro|Aluno');
        $this->loader->Load('head');
        $this->loader->loadModel('cadastroAlunoModel');

        if ($data['usercategory'] == 'admin') {
            $title = 'Administrador';
            $link = 'admin';
        } else {
            $title = 'Professor';
            $link = 'areaProfessor';
        }        


        $this->breadcrumbs->setBreadcrumbs('Cadastro Aluno', 'cadastroAluno', $title, $link);
        $breadcrumbs = $this->breadcrumbs->getBreadcrumbs();

        $data['username'] = $_SESSION['username'];
        $data['destroy'] = PATH_URL . 'sessions/destroy';

        $data['filename'] = 'views/admin/cadastroAluno.tpl';
        if (file_exists($data['filename'])) {
            require_once 'views/admin/cadastroAluno.tpl';
        }
        $this->loader->Load('footer');
    }

}
