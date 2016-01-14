<?php

class Error extends Controller {

    function index() {
        $data = array();
        $this->document->setTitle('Erro');
        $this->loader->Load('header');
        
        $data['filename'] = 'views/error/error.tpl';
        if (file_exists($data['filename'])) {
            require_once 'views/error/error.tpl';
        }
        
        $this->loader->Load('footer');
    }

}
