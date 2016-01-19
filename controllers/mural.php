<?php

class Mural extends Controller {
    
    function index() {
        $data = array();
        $this->document->setTitle('Mural');
        $this->loader->Load('head');
        
        $this->breadcrumbs->setBreadcrumbs('Mural', 'mural');
        $breadcrumbs = $this->breadcrumbs->getBreadcrumbs();
        
        $this->loader->loadModel('muralModel');
        
        $data['image'] = PATH_URL . 'public/images/mural/mural.png';
        
        $data['results'] = $this->muralModel->getAllArticles();        
        
        
        
            
        
        $data['filename'] = 'views/mural.tpl';
        if (file_exists($data['filename'])) {
            require_once 'views/mural.tpl';
        }

        $this->loader->Load('footer');
    }
    
    
}