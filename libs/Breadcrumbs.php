<?php

class Breadcrumbs {
    
    protected $data = array();
    
    protected $registry;
    
    function __construct($registry) {
        $this->registry = $registry;
    }
    
    function setBreadcrumbs($name, $link, $parent = null, $parentlink = null) {
        $this->data['breadcrumbs'] = array();
        $this->data['breadcrumbs'][] = array(
            'title' => 'Home',
            'link' => PATH_URL . 'home'
        );
        
        if (isset($parent) and isset($parentlink)) {
            $this->data['breadcrumbs'][] = array(
                'title' => $parent,
                'link' => PATH_URL . $parentlink
            );
        }

        $this->data['breadcrumbs'][] = array(
            'title' => $name,
            'link' => PATH_URL . $link
        );
    }

    function getBreadcrumbs() {
        return $this->data['breadcrumbs'];
    }
    
}