<?php
class About extends control{
    public function index($nama= 'farid', $pekerjaan= 'mahasiswa')
    {
        $data['nama'] = $nama;
        $data['pekerjaan'] = $pekerjaan;
        $data['judul']='about me';
        $this->view('tamplate/header', $data);
        $this->view('About/index', $data);
        $this->view('tamplate/footer');
    }

    public function page()
    {
        $data['judul']='page';
        $this->view('tamplate/header', $data);
        $this->view('About/page');
        $this->view('tamplate/footer');
    }
}