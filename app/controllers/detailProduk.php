<?php
class detailProduk extends control{
  
    public function man($id_produk)
    {
        $data['judul']='detail produk man';
 
        $data['produk']= $this->model('Produk_model')->getProductDetails($id_produk);
        $this->view('tamplate/header', $data);
        $this->view('detailProduk/man', $data);
        $this->view('tamplate/footer');
       
    }
    public function index($id_produk)
    {
        $data['judul']='detail produk';
 
        $data['produk']= $this->model('Produk_model')->getProductDetails($id_produk);
      	  $this->view('tamplate/header', $data);
        $this->view('detailProduk/index', $data);
        $this->view('tamplate/footer');
       
    }
    public function Kids($id_produk)
    {
        $data['judul']='detail produk';
 
        $data['produk']= $this->model('Produk_model')->getProductDetails($id_produk);
        $this->view('tamplate/header', $data);
        $this->view('detailProduk/kids', $data);
        $this->view('tamplate/footer');
       
    }
    public function woman($id_produk)
    {
        $data['judul']='detail produk';
 
        $data['produk']= $this->model('Produk_model')->getProductDetails($id_produk);
        $this->view('tamplate/header', $data);
        $this->view('detailProduk/woman', $data);
        $this->view('tamplate/footer');
       
    }
}
