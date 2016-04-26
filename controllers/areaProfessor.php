<?php

class AreaProfessor extends Controller {
    
    function index(){
        $data = array();
        $data['username'] = $_SESSION['username'];
        $data['usercategory'] = $_SESSION['usercategory'];
        
        if (!isset($data['username']) and !isset($data['usercategory'])){
            header("Location:" . PATH_URL . 'login');
        }
        
        if ($data['usercategory'] != 'areaProfessor') {
            header("Location:" . PATH_URL . 'error');
        }
        
        $url = $this->url->getUrl();
        if (isset($url[1])){
            header("Location:" . PATH_URL . 'areaProfessor');
        }
        
        $this->loader->loadModel('areaProfessorModel');
        $this->document->setTitle('Área do Professor');
        $this->loader->Load('head');
        
        $data['grupoalunos'] = $this->areaProfessorModel->getGrupoAlunos($_SESSION['username']);
        $data['grupos'] = $this->areaProfessorModel->getGrupos($_SESSION['username']);
        $data['recadogrupo'] = $this->areaProfessorModel->getRecados();
        
        //print_r($data['recadogrupo']);
        
        $this->breadcrumbs->setBreadcrumbs('Professor', 'areaProfessor');
        $breadcrumbs = $this->breadcrumbs->getBreadcrumbs();
        
        $username = $_SESSION['username'];
        $usercategory = $_SESSION['usercategory'];
        
        
        $destroy = PATH_URL . 'sessions/destroy';

        $data['filename'] = 'views/admin/areaProfessor.tpl';
        if (file_exists($data['filename'])) {
            require_once 'views/admin/areaProfessor.tpl';
        }


        $this->loader->Load('footer');
    }
    
    function insertRecado($codGrupo) {
        $this->areaProfessorModel->insertRecado($codGrupo);
    }
    
    function updateRecado($id) {
        $this->areaProfessorModel->updateRecado($id);
    }
    
    function deleteRecado($id) {
        $this->areaProfessorModel->deleteRecado($id);
    }
    
}