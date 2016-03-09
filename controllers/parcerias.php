<?php

class Parcerias extends Controller {
    
    function index() {
        $data = array();
        $this->document->setTitle('Parcerias');
        $this->loader->Load('head');
        
        $this->breadcrumbs->setBreadcrumbs('Parcerias', 'parcerias');
        $breadcrumbs = $this->breadcrumbs->getBreadcrumbs();
        
        
        $data['filename'] = 'views/parcerias.tpl';
        if (file_exists($data['filename'])) {
            require_once 'views/parcerias.tpl';
        }

        $this->loader->Load('footer');
    }
    
}