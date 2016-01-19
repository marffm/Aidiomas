<?php

class Teste extends Controller {
    
    function index(){
        $data = array();
        $this->document->setTitle('Teste');
        
        $this->loader->Load('head');
        
        $this->loader->loadModel('testModel');
        
        $results = $this->testModel->getTest();
        
        $teste = $results[1]['title'];       

        echo $teste;
        
        
        
        $data['filename'] = 'views/teste.tpl';
        if (file_exists($data['filename'])) {
            require_once 'views/teste.tpl';
        }
        
        $this->loader->Load('footer');
    }

}