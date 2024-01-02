<?php

class Produk_model {
    private $db;
    private $table = 'produk';

    public function __construct() {
        $this->db = new Database; // Assuming you have a Database class
    }

    public function getAllProduk()
    {
       $this->db->query('SELECT * FROM '. $this->table);
       return $this->db->resultSet();
    }

    public function getProductDetails($id_produk) {
        $this->db->query('SELECT * FROM ' . $this->table . ' WHERE id_produk = :id_produk');
        $this->db->bind(':id_produk', $id_produk);

        return $this->db->single();
    }
}
