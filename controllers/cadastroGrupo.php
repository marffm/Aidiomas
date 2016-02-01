<?php

class cadastroGrupo extends Controller {

    function index() {

        $data = array();
        $data['username'] = $_SESSION['username'];
        $data['usercategory'] = $_SESSION['usercategory'];

        if (!isset($data['username']) and ! isset($data['usercategory'])) {
            header("Location:" . PATH_URL . 'login');
        }

        if ($data['usercategory'] == 'areaProfessor') {
            header("Location:" . PATH_URL . 'areaProfessor');
        }

        $url = $this->url->getUrl();
        
        if (isset($url[1])) {
            header("Location:" . PATH_URL . 'cadastroGrupo');
        }
        
        if (isset($_SESSION['error_insertGrupo'])) {
            $error = 'Grupo inserido já existe no sistema.';
            $_SESSION['error_insertGrupo'] = null;
        }
        

        $this->document->setTitle('Grupos');
        $this->loader->Load('head');

        $this->breadcrumbs->setBreadcrumbs('Grupos', 'cadastroGrupo', 'Administrador', 'admin');
        $breadcrumbs = $this->breadcrumbs->getBreadcrumbs();

        $username = $_SESSION['username'];

        $this->loader->loadModel('cadastroGrupoModel');

        $destroy = PATH_URL . 'sessions/destroy';



        $data['idiomaslist'] = $this->cadastroGrupoModel->getIdiomas();
        $data['professoreslist'] = $this->cadastroGrupoModel->getProfessores();
        $data['alunolist'] = $this->cadastroGrupoModel->getAlunos();
        $data['gruposlist'] = $this->cadastroGrupoModel->getGrupos();
        $data['alunogrupolist'] = $this->cadastroGrupoModel->getAluno_Grupo();
        
        //print_r($data['alunogrupolist']);

        $data['filename'] = 'views/admin/cadastroGrupo.tpl';
        if (file_exists($data['filename'])) {
            require_once 'views/admin/cadastroGrupo.tpl';
        }


        $this->loader->Load('footer');
    }

    function validateGrupo() {
        $validate = $this->cadastroGrupoModel->checkGrupo();

        if ($validate == false) {
            $_SESSION['error_insertGrupo'] = true;
        } else {
            $this->cadastroGrupoModel->insertGrupo();
        }
        return $validate;
    }
    
}
