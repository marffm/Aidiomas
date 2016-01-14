<?php

class Breadcrumbs {
    
    protected $data = array();
    
    protected $registry;
    
    function __construct($registry) {
        $this->registry = $registry;
    }
    
    function setBreadcrumbs($name, $link) {
        $this->data['breadcrumbs'] = array();
        $this->data['breadcrumbs'][] = array(
            'title' => 'Home',
            'link' => PATH_URL . 'home'
        );
        
        $this->data['breadcrumbs'][] = array(
            'title' => $name,
            'link' => $link
        );
    }

    function getBreadcrumbs() {
        return $this->data['breadcrumbs'];
    }
    
}