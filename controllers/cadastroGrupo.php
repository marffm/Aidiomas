<?php

class cadastroGrupo extends Controller {

    function index() {

        $data = array();
        $data['username'] = $_SESSION['username'];
        $data['usercategory'] = $_SESSION['usercategory'];

        if (!isset($data['username']) and ! isset($data['usercategory'])) {
            header("Location:" . PATH_URL . 'login');
        }

        if ($data['usercategory'] == 'areaProfessor') {
            header("Location:" . PATH_URL . 'areaProfessor');
        }

        $url = $this->url->getUrl();
        
        if (isset($url[1])) {
           header("Location:" . PATH_URL . 'cadastroGrupo');
        }
        
        if (isset($_SESSION['error_insertGrupo'])) {
            $error = 'Grupo inserido já existe no sistema.';
            $_SESSION['error_insertGrupo'] = null;
        }
        
        if (isset($_SESSION['error_insertAluno_Grupo'])) {
            $erroraluno_grupo = 'Aluno já inserido no Grupo: ';
            $errorposition = $_SESSION['error_position'];
            $_SESSION['error_insertAluno_Grupo'] = null;
            $_SESSION['error_position'] = null;
        }
        

        $this->document->setTitle('Grupos');
        $this->loader->Load('head');

        $this->breadcrumbs->setBreadcrumbs('Grupos', 'cadastroGrupo', 'Administrador', 'admin');
        $breadcrumbs = $this->breadcrumbs->getBreadcrumbs();

        $username = $_SESSION['username'];

        $this->loader->loadModel('cadastroGrupoModel');

        $destroy = PATH_URL . 'sessions/destroy';



        $data['idiomaslist'] = $this->cadastroGrupoModel->getIdiomas();
        $data['professoreslist'] = $this->cadastroGrupoModel->getProfessores();
        $data['alunolist'] = $this->cadastroGrupoModel->getAlunos();
        $data['gruposlist'] = $this->cadastroGrupoModel->getGrupos();
        $data['alunogrupolist'] = $this->cadastroGrupoModel->getAluno_Grupo();
        $data['boletinslist'] = $this->cadastroGrupoModel->getBoletins();
        
        //print_r($data['boletinslist']);

        $data['filename'] = 'views/admin/cadastroGrupo.tpl';
        if (file_exists($data['filename'])) {
            require_once 'views/admin/cadastroGrupo.tpl';
        }


        $this->loader->Load('footer');
    }

    function validateGrupo() {
        $validate = $this->cadastroGrupoModel->checkGrupo();

        if ($validate == false) {
            $_SESSION['error_insertGrupo'] = true;
        } else {
            $this->cadastroGrupoModel->insertGrupo();
        }
        return $validate;
    }
    
    function validadeInsertAluno_Grupo() {
        
        $validate = $this->cadastroGrupoModel->checkInsertAluno_Grupo();
        
        if ($validate == false) {
            $_SESSION['error_insertAluno_Grupo'] = true;
            $_SESSION['error_position'] = $_POST['cod_grupo'];
        } else {
            $this->cadastroGrupoModel->insertAluno_Grupo();
        }
        
    }    

    function deleteAluno_Grupo($id) {
        $code = explode('_', $id);
        $this->cadastroGrupoModel->deleteAluno_Grupo($code);
    }
    
    function deleteGrupo($id) {
        $this->cadastroGrupoModel->deleteGrupo($id);
    }
    
    function updateGrupo() {
        $this->cadastroGrupoModel->updateGrupo();
    }

}
