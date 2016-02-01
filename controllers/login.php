<?php

class Login extends Controller {
    protected $user = array();
    protected $data = array();

    function index() {
        $this->document->setTitle('Login');
        $this->breadcrumbs->setBreadcrumbs('Login', 'login');
        $breadcrumbs = $this->breadcrumbs->getBreadcrumbs();

        $this->loader->Load('head');
        
        $this->loader->loadModel('loginModel');
        
        
        $error = $this->url->getUrl();        
        if (isset($error[1])) {
            $this->data['error'] = 'Usuário ou Senha invalida.';
        }
         
        $verify = PATH_URL . 'sessions/verify';

        $data['filename'] = 'views/admin/login.tpl';
        if (file_exists($data['filename'])) {
            require_once 'views/admin/login.tpl';
        }

        $this->loader->Load('footer');
    }
    
    function error(){        
    }
    
    function verify(){
        $this->loginModel->verify();
    }

}
