<?php

class cadastrarProf extends Controller {
    
    function index() {
        
        $data = array();
        $data['username'] = $_SESSION['username'];
        $data['usercategory'] = $_SESSION['usercategory'];
        
        if (!isset($data['username']) and !isset($data['usercategory'])) {
            header("Location:" . PATH_URL . 'login');
        }
        
        if ($data['usercategory'] != 'admin') {
            header("Location:" . PATH_URL . 'error');
        }
        
        $this->document->setTitle('Cadastro|Professor');
        $this->loader->Load('head');
        $this->loader->loadModel('cadastrarProfModel');
        
        $this->breadcrumbs->setBreadcrumbs('Cadastro Professor', 'cadastrarProf', 'Administrador', 'admin');
        $breadcrumbs = $this->breadcrumbs->getBreadcrumbs();
        
        $data['username'] = $_SESSION['username'];
        $data['destroy'] = PATH_URL . 'sessions/destroy';
        
        
        
        
        
        $data['filename'] = 'views/admin/cadastrarProf.tpl';
        if (file_exists($data['filename'])) {
            require_once 'views/admin/cadastrarProf.tpl';
        }
        $this->loader->Load('footer');
    }
    
    function insertProf() {
        $this->cadastrarProfModel->insertProf();
    }
    
}