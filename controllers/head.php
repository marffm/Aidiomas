<?php

class Head extends Controller {
    
    function index() {
        $data = array();
        
        $data['pageTitle'] = $this->document->getTitle();
        
        $login = array();
        $login['admin'] = PATH_URL . 'sessions/checkSession/admin';
        $login['area_professor'] = PATH_URL . 'sessions/checkSession/areaProfessor';
        $login['area_aluno'] = PATH_URL . 'sessions/checkSession/areaAluno';
        
        if (isset($_SESSION['usercategory'])) {
            
            if ($_SESSION['usercategory'] == 'admin') {
                $text_admin = 'Bem vindo ' . $_SESSION['username'];
                $text_link = $login['admin'];
            } else if ($_SESSION['usercategory'] == 'areaProfessor') {
                $text_admin = 'Bem vindo Professor(a) ' . $_SESSION['username'];
                $text_link = $login['area_professor'];
            } else if ($_SESSION['usercategory'] == 'areaAluno') {
                $text_admin = 'Bem vindo Aluno(a) ' . $_SESSION['username'];
                $text_link = $login['area_aluno'];
            }
            
        } else {
            $text_admin = 'Login';
            $text_link = $login['admin'];
        }



        $data['filename'] = 'views/common/head.tpl';
        if (file_exists($data['filename'])) {
            require_once 'views/common/head.tpl';
        }
    }
    
}