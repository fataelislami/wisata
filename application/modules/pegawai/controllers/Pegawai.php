<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Pegawai extends MY_Controller{

  public function __construct()
  {
    parent::__construct();
    //Codeigniter : Write Less Do More
    $this->load->model(array('Dbs'));
  }

  function index()
  {
    $nama='fata';
    $data=$this->Dbs->getdata()->result();
    $username=$data[0]->username;
    $data = array('nama' => $nama, );
    $this->load->view('pegawai/home',$data);
  }

  function tambahdata(){
    echo "ini fitur tambah data";
  }

}
