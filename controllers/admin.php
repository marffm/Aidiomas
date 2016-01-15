<?php

class Admin extends Controller {
    
    function index() {
        $data = array();
        $this->document->setTitle('Admin');
        $this->loader->Load('header');
        
        $username = isset($_SESSION['username']) ? $_SESSION['username'] : null;
        
        $this->breadcrumbs->setBreadcrumbs('Administrador', 'admin');
        $breadcrumbs = $this->breadcrumbs->getBreadcrumbs();
        
        
        
        if (!$username) {
            $this->loader->Load('login');
        } else {
            $data['filename'] = 'views/admin/admin.tpl';
            if (file_exists($data['filename'])) {
                require_once 'views/admin/admin.tpl';
            }
        }


        $this->loader->Load('footer');
    }
    
    
    function destroy() {
        session_destroy();
    }
    
    
}