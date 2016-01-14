<?php

class Slideshow extends Controller {
    
    function index() {
        $data = array();
        
        $data['filename'] = 'views/common/slideshow.tpl';
        if (file_exists($data['filename'])) {
            require_once 'views/common/slideshow.tpl';
        }
    }   
    
}