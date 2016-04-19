<?php

class areaAluno extends Controller {
    
    function index() {
        $data = array();
        $data['username'] = $_SESSION['username'];
        $data['usercategory'] = $_SESSION['usercategory'];
        $data['alunocodigo'] = $_SESSION['alunocodigo'];
        
        if (!isset($data['username']) and !isset($data['usercategory'])){
            header("Location:" . PATH_URL . 'login');
        }
        
        if ($data['usercategory'] != 'areaAluno') {
            header("Location:" . PATH_URL . 'error');
        }
        
        $this->loader->loadModel('alunoModel');
        
        $data['aluno'] = $this->alunoModel->setAluno($data['alunocodigo']);
        $data['alunogrupo'] = $this->alunoModel->getGrupo($data['alunocodigo']);
        $data['alunoboletins'] = $this->alunoModel->getBoletins($data['alunocodigo']);
        //print_r($_SESSION['usercategory']);
        
        $this->document->setTitle('Área do Aluno');
        $this->loader->Load('head');
        
        $this->breadcrumbs->setBreadcrumbs('Aluno', 'areaAluno');
        $breadcrumbs = $this->breadcrumbs->getBreadcrumbs();
        
        $destroy = PATH_URL . 'sessions/destroy';
        
        
        $data['filename'] = 'views/admin/areaAluno.tpl';
        if (file_exists($data['filename'])) {
            require_once 'views/admin/areaAluno.tpl';
        }


        $this->loader->Load('footer');
        
    }
    
}