<?php

class Aprendizagem extends Controller {
    
    function index() {
        $data = array();
        $this->document->setTitle('Aprendizagem');
        $this->loader->Load('head');
        
        $this->breadcrumbs->setBreadcrumbs('Aprendizagem', 'aprendizagem');
        $breadcrumbs = $this->breadcrumbs->getBreadcrumbs();
        
        
        $data['filename'] = 'views/aprendizagem.tpl';
        if (file_exists($data['filename'])) {
            require_once 'views/aprendizagem.tpl';
        }

        $this->loader->Load('footer');
        
    }
    
}