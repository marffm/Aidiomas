<?php

class loginModel extends Model {

    protected $user = array(); 
    

    public function setUser() {
        $this->user[0] = array(
            'username' => 'Marcelo',
            'password' => '123',
            'category' => 'admin'
        );
        $this->user[1] = array(
            'username' => 'Fabiana',
            'password' => '456',
            'category' => 'area_professor'
        );
        
        return $this->user;
    }
    
    public function getUser() {
        return $this->user;
    }

}
