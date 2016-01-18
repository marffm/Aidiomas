<?php

class AreaProfessor extends Controller {
    
    function index(){
        
        $username = $_SESSION['username'];
        $user_category = $_SESSION['usercategory'];
        
        if (!isset($username) and !isset($user_category)){
            header("Location:" . PATH_URL . 'login');
        }
        
        if ($user_category != 'areaProfessor') {
            header("Location:" . PATH_URL . 'teste');
        }
        
        $data = array();
        
        $this->document->setTitle('Área do Professor');
        $this->loader->Load('head');
        
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
    
}