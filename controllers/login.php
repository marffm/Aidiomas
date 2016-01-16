<?php

class Login extends Controller {
    
    protected $user = array();
            
    function index(){
        $this->document->setTitle('Login');
        $this->breadcrumbs->setBreadcrumbs('Login', 'login');
        $breadcrumbs = $this->breadcrumbs->getBreadcrumbs();
        
        $this->loader->Load('head');
        
        $this->loader->loadModel('loginModel');
        $this->loginModel->setUser();
        $teste = $this->loginModel->getUser();
        $key = array_search('Marcelo', array_column($teste, 'username'), true);
        
        echo $key;
        
        $verify = PATH_URL . 'sessions/verify';
                
        
        $data['filename'] = 'views/admin/login.tpl';
        if (file_exists($data['filename'])) {
            require_once 'views/admin/login.tpl';
        }       
        
        $this->loader->Load('footer');
    }  
    
    
}