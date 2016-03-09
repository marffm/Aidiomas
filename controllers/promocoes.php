<?php

class Promocoes extends Controller {
    
    function index() {
        $data = array();
        $this->document->setTitle('Promoções');
        $this->loader->Load('head');
        
        $this->breadcrumbs->setBreadcrumbs('Promoções', 'promocoes');
        $breadcrumbs = $this->breadcrumbs->getBreadcrumbs();
        
        
        $data['filename'] = 'views/promocoes.tpl';
        if (file_exists($data['filename'])) {
            require_once 'views/promocoes.tpl';
        }

        $this->loader->Load('footer');
        
    }
    
}