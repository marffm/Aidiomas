<?php

class Head extends Controller {
    
    function index() {
        $data = array();
        
        $data['pageTitle'] = $this->document->getTitle();
        
        $login = array();
        $login['admin'] = PATH_URL . 'sessions/checkSession/admin';
        $login['area_professor'] = PATH_URL . 'sessions/checkSession/areaProfessor';
        $login['area_aluno'] = PATH_URL . 'sessions/checkSession/areaAluno';
        
        
        
        $data['filename'] = 'views/common/head.tpl';
        if (file_exists($data['filename'])) {
            require_once 'views/common/head.tpl';
        }
    }
    
}