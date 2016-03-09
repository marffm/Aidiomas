<?php

class Estrutura extends Controller {
    
    function index() {
        $data = array();
        $this->document->setTitle('Estruturas');
        $this->loader->Load('head');
        
        $this->breadcrumbs->setBreadcrumbs('Estrutura', 'estrutura');
        $breadcrumbs = $this->breadcrumbs->getBreadcrumbs();
        
        
        $data['filename'] = 'views/estrutura.tpl';
        if (file_exists($data['filename'])) {
            require_once 'views/estrutura.tpl';
        }

        $this->loader->Load('footer');
        
    }
    
}