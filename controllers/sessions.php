<?php

class Sessions extends Controller {

    function index() {
        
    }

    function checkSession($name) {

        if (isset($_SESSION['username']) and isset($_SESSION['usercategory'])) {
            header("Location:" . PATH_URL . $_SESSION['usercategory']);
        } else {
            header("Location:" . PATH_URL . 'login');
        }
    }

    function verify() {
        $name = $_POST['username'];
        $user_pass = $_POST['password'];
        
        $this->loader->loadModel('loginModel');
        $this->loginModel->setUser();        
        $user = $this->loginModel->getUser();
        
        if (in_array($name, array_column($user, 'username'))) {            
            $username = true;
        }        
        if (in_array($user_pass, array_column($user, 'password'))) {
            $password = true;
        }

        if ($username and $password ) {
            $_SESSION['username'] = $name;
            $_SESSION['usercategory'] = $user[$name]['category'];
            header("Location:" . PATH_URL . $user[$name]['category']);
        } else {
            header("Location:" . PATH_URL . 'login/error');            
        }
    }

    function destroy() {
        session_destroy();
        header("Location:" . PATH_URL . 'home');
    }

}
