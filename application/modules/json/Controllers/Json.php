<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Json extends MY_Controller{

  public function __construct()
  {
    parent::__construct();
    //Codeigniter : Write Less Do More
    $this->load->model(array('Dbs'));
  }

  function index()
  {

  }

  function get_kota(){
    $data=$this->Dbs->getdata('kota')->result();
    $json=json_encode($data);
    echo $json;
  }

  function get_kecamatan(){
    $data=$this->Dbs->getdata('kecamatan')->result();
    $json=json_encode($data);
    echo $json;
  }
  function get_kecamatan_by_kota($id_kota){
    $data=$this->Dbs->getwhere('id_kota',$id_kota,'kecamatan')->result();
    $json=json_encode($data);
    echo $json;
  }

  function get_kelurahan(){
    $data=$this->Dbs->getdata('kelurahan')->result();
    $json=json_encode($data);
    echo $json;
  }

  function get_kelurahan_by_kecamatan($id_kecamatan){
    $data=$this->Dbs->getwhere('id_kecamatan',$id_kecamatan,'kelurahan')->result();
    $json=json_encode($data);
    echo $json;
  }

  function get_gambar_by_id($id){
    $data=$this->Dbs->getwhere('id_wisata',$id,'gambar')->result();
    $json=json_encode($data);
    echo $json;
  }

}
