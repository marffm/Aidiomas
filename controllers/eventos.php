<?php

class Eventos extends Controller {
    
    function index() {
        $data = array();
        $this->document->setTitle('Eventos');
        $this->loader->Load('head');

        $this->breadcrumbs->setBreadcrumbs('Eventos', 'eventos');
        $breadcrumbs = $this->breadcrumbs->getBreadcrumbs();


        $data['filename'] = 'views/eventos.tpl';
        if (file_exists($data['filename'])) {
            require_once 'views/eventos.tpl';
        }

        $this->loader->Load('footer');
    }

}