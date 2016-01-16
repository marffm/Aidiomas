<?php

class Admin extends Controller {

    function index() {
        if (!isset($_SESSION['username'])) {
            header("Location:" . PATH_URL . 'login');
        }
        
        $data = array();
        
        $this->document->setTitle('Admin');
        $this->loader->Load('head');

        $this->breadcrumbs->setBreadcrumbs('Administrador', 'admin');
        $breadcrumbs = $this->breadcrumbs->getBreadcrumbs();

        $username = $_SESSION['username'];
        
        
        $destroy = PATH_URL . 'sessions/destroy';

        $data['filename'] = 'views/admin/admin.tpl';
        if (file_exists($data['filename'])) {
            require_once 'views/admin/admin.tpl';
        }


        $this->loader->Load('footer');
    }

}
