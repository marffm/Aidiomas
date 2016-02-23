<?php

class Admin extends Controller {

    function index() {
        
        $data = array();
        $data['username'] = $_SESSION['username'];
        $data['usercategory'] = $_SESSION['usercategory'];
        
        if (!isset($data['username']) and !isset($data['usercategory'])) {
            header("Location:" . PATH_URL . 'login');
        }

        if ($data['usercategory'] == 'areaProfessor') {
            header("Location:" . PATH_URL . 'areaProfessor');
        }
        
        if ($data['usercategory'] == 'areaAluno') {
            header("Location:" . PATH_URL . 'areaAluno');
        }
        
        $url = $this->url->getUrl();
        
        if (isset($url[1])){
            header("Location:" . PATH_URL . 'admin');
        }


        $this->document->setTitle('Admin');
        $this->loader->Load('head');

        $this->breadcrumbs->setBreadcrumbs('Administrador', 'admin');
        $breadcrumbs = $this->breadcrumbs->getBreadcrumbs();

        $username = $_SESSION['username'];

        $this->loader->loadModel('adminModel');
        $data['results'] = $this->adminModel->getMural();

        $destroy = PATH_URL . 'sessions/destroy';


        $data['professorlist'] = $this->adminModel->getProfessor();
        $data['alunolist'] = $this->adminModel->getAluno();
        $data['grupolist'] = $this->adminModel->getGrupo();
        
        //print_r($data['alunolist']);


        $data['filename'] = 'views/admin/admin.tpl';
        if (file_exists($data['filename'])) {
            require_once 'views/admin/admin.tpl';
        }


        $this->loader->Load('footer');
    }

    function saveArticle() {
        $this->adminModel->saveMural();
    }

    function deleteArticle($id) {
        $this->adminModel->deleteMural($id);
    }
    
    function updateArticle($id) {
        $this->adminModel->updateMural($id);
    }

}
