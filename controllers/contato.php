<?php

class Contato extends Controller {
    
    function index() {
        $data = array();
        $this->document->setTitle('Contato');
        $this->loader->Load('head');
        
        $this->breadcrumbs->setBreadcrumbs('Contato', 'contato');
        $breadcrumbs = $this->breadcrumbs->getBreadcrumbs();
        
        
        $data['filename'] = 'views/contato.tpl';
        if (file_exists($data['filename'])) {
            require_once 'views/contato.tpl';
        }

        $this->loader->Load('footer');
        
    }
    
}