<?php

class Artigo extends Controller {
    
    function index() {
        $data = array();
        $this->document->setTitle('Artigos');
        $this->loader->Load('head');
        
        
        $url = $this->url->getUrl();
        
        
        $this->breadcrumbs->setBreadcrumbs('Artigo', 'artigo/setArtigo/' . $url[2], 'Mural', 'mural');
        $breadcrumbs = $this->breadcrumbs->getBreadcrumbs();
        
        $this->loader->loadModel('muralModel');
        
        $url = $this->url->getUrl();
        
        if (isset($url[2])) {
            $data['articles'] = $this->muralModel->getArticlebyId($url[2]);        
        } else {
            $data['articles'] = 'Artigo não encontrado';
        }
        
        $dataArtigo = $data['articles'][0]['date'];        
        $dataArtigo = explode('-', $dataArtigo);
        $dataFinal = $dataArtigo[2] . '-' . $dataArtigo[1] . '-' . $dataArtigo[0];
        
        $data['image'] = PATH_URL . 'public/images/mural/mural.png';
        
        
        
        
        $data['filename'] = 'views/artigo.tpl';
        if (file_exists($data['filename'])) {
            require_once 'views/artigo.tpl';
        }

        $this->loader->Load('footer');
        
    }
    
    function setArtigo($id) {
        $articles = $this->muralModel->getArticlebyId($id);        
    }
    
}