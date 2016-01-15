<?php

class Login extends Controller {
    
    protected $user = array();
            
    function index(){
        $this->document->setTitle('Login');
        $this->breadcrumbs->setBreadcrumbs('Login', 'login');
        $breadcrumbs = $this->breadcrumbs->getBreadcrumbs();
        
        $this->loader->Load('head');
                
        
        $data['filename'] = 'views/admin/login.tpl';
        if (file_exists($data['filename'])) {
            require_once 'views/admin/login.tpl';
        }       
        
        $this->loader->Load('footer');
    }
    
    
    
    function verify() {
        $this->user['name'] = "Marcelo";
        $this->user['password'] = "123";
        
        
        if ($this->user['name'] == $_POST['username'] and $this->user['password'] == $_POST['password']) {
            $_SESSION['username'] = $this->user['name'];
            
        } 
    }
    
}