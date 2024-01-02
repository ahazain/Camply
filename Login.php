<?php
class Login {
    public function authenticate($email, $password) {
        // Logika autentikasi sederhana (contoh)
        $validEmail = 'user@example.com';
        $validPassword = 'secret';

        if ($email === $validEmail && $password === $validPassword) {
            return true;
        } else {
            return false;
        }
    }
}
?>