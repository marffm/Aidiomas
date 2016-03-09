<?php

class Curso extends Controller {
    
    function index() {
        $data = array();
        $this->document->setTitle('Cursos');
        $this->loader->Load('head');
        
        $this->breadcrumbs->setBreadcrumbs('Cursos', 'curso');
        $breadcrumbs = $this->breadcrumbs->getBreadcrumbs();
        
        
        $data['filename'] = 'views/curso.tpl';
        if (file_exists($data['filename'])) {
            require_once 'views/curso.tpl';
        }

        $this->loader->Load('footer');
        
    }
    
}