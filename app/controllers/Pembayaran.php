<?php
class Pembayaran extends control{
    public function index()
    {
        $data['judul']='pembayaran';
        $this->view('tamplate/header', $data);
        $this->view('pembayaran/index');
        $this->view('tamplate/footer');

    }
    public function checkout()
    {
       
        $this->view('pembayaran/checkout');
     

    }
}