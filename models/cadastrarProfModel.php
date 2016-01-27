<?php

class cadastrarProfModel extends Model {

    function insertProf() {
        echo $_POST['nome'] . '<br />';
        echo $_POST['sobrenome'] . '<br />';
        echo $_POST['usuario'] . '<br />';
        echo $_POST['senha'];
    }

    function getProfs() {
        $conn = $this->db->connectionDB();
        $stmt = $conn->prepare("SELECT * FROM professor");
        $stmt->execute();
        $results = $stmt->fetchall(PDO::FETCH_ASSOC);
        $conn = null;
        
        return $results;
    }

}
