<?php

class Teste extends Controller {
    
    function index(){
        $data = array();
        $this->document->setTitle('Teste');
        
        $this->loader->Load('header');

        
        
        
        
        $data['filename'] = 'views/teste.tpl';
        if (file_exists($data['filename'])) {
            require_once 'views/teste.tpl';
        }
        
        $this->loader->Load('footer');
    }


    function test(){
        
        echo 'teste';
        return;
    }
    
}