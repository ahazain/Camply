<?php
use PHPUnit\Framework\TestCase;

require_once 'Login.php';

class LoginTest extends TestCase {
    public function testAuthenticateWithValidCredentials() {
        // Membuat objek Login
        $login = new Login();

        // Memanggil metode authenticate dengan kredensial yang benar
        $result = $login->authenticate('user@example.com', 'secret');

        // Memeriksa apakah autentikasi berhasil
        $this->assertTrue($result);
    }

    public function testAuthenticateWithInvalidCredentials() {
        // Membuat objek Login
        $login = new Login();

        // Memanggil metode authenticate dengan kredensial yang salah
        $result = $login->authenticate('wronguser@example.com', 'wrongpassword');

        // Memeriksa apakah autentikasi gagal
        $this->assertFalse($result);
    }
}

?>