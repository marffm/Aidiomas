<?php

class Header extends Controller {
    
    function index() {
        $data = array();
        
        $data['pageTitle'] = $this->document->getTitle();
        
        
        
        
        $data['filename'] = 'views/common/header.tpl';
        if (file_exists($data['filename'])) {
            require_once 'views/common/header.tpl';
        }
    }
    
}