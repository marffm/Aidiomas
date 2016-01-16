<?php

class Home extends Controller {
    
    function index(){
        $data = array();
        $this->document->setTitle('Home');
        
        $this->loader->Load('head');
        
        $this->loader->Load('slideshow');        
        
        
        
        $data['filename'] = 'views/home.tpl';
        if (file_exists($data['filename'])) {
            require_once 'views/home.tpl';
        }
        
        $this->loader->Load('footer');
    }


    function test(){        
        echo 'teste';        
    }
    
}