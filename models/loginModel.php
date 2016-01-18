<?php

class loginModel extends Model {

    protected $user = array(); 
    

    public function setUser() {
        $this->user['Marcelo'] = array(
            'username' => 'Marcelo',
            'password' => '123',
            'category' => 'admin'
        );
        $this->user['Fabiana'] = array(
            'username' => 'Fabiana',
            'password' => '456',
            'category' => 'areaProfessor'
        );
        

    }
    
    public function getUser() {
        return $this->user;
    }

}
