<?php

final class Url {
    private $registry;

    public function __construct($registry) {
        $this->registry = $registry;
        //echo '<br/>We loaded the URL controller';
    }

    public function getUrl() {
        $url = array();
        $url = isset($_GET['url']) ? $_GET['url'] : 'home';
        $url = rtrim($url, '/');
        $url = explode('/', $url);

        return $url;
        
    }

// ---- End GetUrl ----
}