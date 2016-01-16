<?php

class Sessions extends Controller {

    function index() {
        
    }

    function checkSession($name) {

        if (isset($_SESSION['username']) and isset($_SESSION['usercategory'])) {

            if ($_SESSION['usercategory'] == $name) {
                header("Location:" . PATH_URL . $name);
            } else {
                header("Location:" . PATH_URL . 'teste');
            }
        } else {
            header("Location:" . PATH_URL . 'login');
        }
    }

    function verify() {

        $this->loader->loadModel('loginModel');
        $this->loginModel->setUser();
        $this->loginModel->getUser();


        if ($username == $_POST['username'] and $password == $_POST['password']) {
            $_SESSION['username'] = $_POST['username'];
            $_SESSION['usercategory'] = $name;
            header("Location:" . PATH_URL . $name);
        } else {
            header("Location:" . PATH_URL . 'login');
        }
    }

    function destroy() {
        session_destroy();
        header("Location:" . PATH_URL . 'home');
    }

}
