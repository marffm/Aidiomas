<?php

class Footer extends Controller {
    
    function index() {
        $data = array();
        
        
        $data['filename'] = 'views/common/footer.tpl';
        if (file_exists($data['filename'])) {
            require_once 'views/common/footer.tpl';
        }
    }
    
}