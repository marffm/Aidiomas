<?php

class Login extends Controller {
    
    protected $user = array();
    protected $data = array();
            
    function index(){
        $this->document->setTitle('Login');
        $this->breadcrumbs->setBreadcrumbs('Login', 'login');
        $breadcrumbs = $this->breadcrumbs->getBreadcrumbs();
        
        $this->loader->Load('header');
        
        $this->data['login_error'] = '';
        
        $data['filename'] = 'views/admin/login.tpl';
        if (file_exists($data['filename'])) {
            require_once 'views/admin/login.tpl';
        }       
        
        $this->loader->Load('footer');
    }
    
    function verify() {
        $this->user['name'] = $_POST['username'];
        $this->user['password'] = $_POST['password'];
        
        
        if ($this->user['name'] = "Marcelo" && $this->user['password'] = "123") {
            $_SESSION['username'] = $this->user['name'];
        } else {
            return $this->data['login_error'] = 'Senha ou usuário incorreto';
        }
    }
    
}