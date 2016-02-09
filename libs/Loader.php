<?php

class Loader {

    private $registry;

    function __construct($registry) {
        $this->registry = $registry;
    }

    public function Load($nameClass) {
        $class = new $nameClass($this->registry);
        $this->registry->set($nameClass, $class);
        $class->index();
    }

    public function loadModel($nameModel) {
        $model = new $nameModel($this->registry);
        $this->registry->set($nameModel, $model);
    }

}
