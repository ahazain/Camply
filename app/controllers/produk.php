<?php
class produk extends control{
    public function index()
    {
        $data['judul']='Daftar Produk';
        $data['pdk']= $this->model('Produk_model')->getAllProduk();
        $this->view('tamplate/header', $data);
        $this->view('produk/index', $data);
        $this->view('tamplate/footer');
    }

    public function man()
    {
        $data['judul']='produk man';
        $data['pdk']= $this->model('Produk_model')->getAllProduk();
        $this->view('tamplate/header', $data);
        $this->view('produk/man', $data);
        $this->view('tamplate/footer');
    }
    public function woman()
    {
        $data['judul']='produk woman';
        $data['pdk']= $this->model('Produk_model')->getAllProduk();
        $this->view('tamplate/header', $data);
        $this->view('produk/woman', $data);
        $this->view('tamplate/footer');
    }
    public function kids()
    {
        $data['judul']='produk woman';
        $data['pdk']= $this->model('Produk_model')->getAllProduk();
        $this->view('tamplate/header', $data);
        $this->view('produk/kids', $data);
        $this->view('tamplate/footer');
    }
}