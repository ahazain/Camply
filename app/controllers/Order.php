<?php class Order extends control{
    public function pembelian()
    {
     
        $this->view('order/pembelian');
       
    }
  	
  	 public function penyewaan()
    {
     
        $this->view('order/penyewaan');
       
    }
   
   
    
   
}