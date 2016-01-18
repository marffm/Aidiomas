<?php

class Login extends Controller {
    
    protected $user = array();
            
    function index(){
        $this->document->setTitle('Login');
        $this->breadcrumbs->setBreadcrumbs('Login', 'login');
        $breadcrumbs = $this->breadcrumbs->getBreadcrumbs();
        
        $this->loader->Load('head');       
        
        $verify = PATH_URL . 'sessions/verify';
        
        
        $error_message = false;
                
        
        $data['filename'] = 'views/admin/login.tpl';
        if (file_exists($data['filename'])) {
            require_once 'views/admin/login.tpl';
        }       
        
        $this->loader->Load('footer');
    }  
    
    
}