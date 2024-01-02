<?php
class Home extends control{
    public function index()
    {
        $data['judul']='Home';
        $this->view('tamplate/header', $data);
        $this->view('Home/index');
        $this->view('tamplate/footer');
    }
}