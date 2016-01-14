<?php

class Eventos extends Controller {
    
    function index(){
        $data = array();
        $this->document->setTitle('Eventos');
        $this->loader->Load('header');
        
        $this->breadcrumbs->setBreadcrumbs('eventos', 'eventos');
        $this->breadcrumbs->getBreadcrumbs();
        
        
        $data['filename'] = 'views/eventos.tpl';
        if (file_exists($data['filename'])) {
            require_once 'views/eventos.tpl';
        }
        
        $this->loader->Load('footer');
        
    }
    
}