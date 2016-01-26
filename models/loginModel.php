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
    
    function verifyUser() {
        
        $username = $_POST['username'];
        $password = $_POST['password'];
        $table = $_POST['category'];
        
        if ($table == 'admin') {
            $sql = "SELECT * FROM admin WHERE usuario='$username' AND senha='$password'";
        } else if ($table == 'professor') {
            $sql = "SELECT * FROM professor WHERE usuario='$username' AND senha='$password'";
        } else {
            $sql = "SELECT * FROM aluno WHERE usuario='$username' AND senha='$password'";
        }
        
        $conn = $this->db->connectionDB();
        $stmt = $conn->prepare($sql);
        $stmt->execute();
        $results = $stmt->fetchall(PDO::FETCH_ASSOC);
        $conn = null;
        
       return $results;
       
    }

}
