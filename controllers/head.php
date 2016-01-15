<?php

class Head extends Controller {
    
    function index() {
        $data = array();
        
        $data['pageTitle'] = $this->document->getTitle();
        
        
        
        
        $data['filename'] = 'views/common/head.tpl';
        if (file_exists($data['filename'])) {
            require_once 'views/common/head.tpl';
        }
    }
    
}