<?php

class Admin extends Controller {

    function index() {
        $data = array();
        
        if (isset($_SESSION['username'])) {

            $this->document->setTitle('Admin');
            $this->loader->Load('head');

            $this->breadcrumbs->setBreadcrumbs('Administrador', 'admin');
            $breadcrumbs = $this->breadcrumbs->getBreadcrumbs();
            
            $username = $_SESSION['username'];
            
            
            function destroy(){
                session_destroy();
            }



            $data['filename'] = 'views/admin/admin.tpl';
            if (file_exists($data['filename'])) {
                require_once 'views/admin/admin.tpl';
            }


            $this->loader->Load('footer');
            
        } else {
            header("Location:" . PATH_URL. "login");
        }
        
    }

    function destroy() {
        session_destroy();
        
    }

}
