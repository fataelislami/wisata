<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Register extends MY_Controller{

  public function __construct()
  {
    parent::__construct();
    //Codeigniter : Write Less Do More
    $this->load->model(array('MPemilik_wisata','Dbs'));
  }

  function index()
  {
    $this->load->view('vRegister');
  }

  function test(){
    echo $this->session->flashdata('errorMessage');
  }
  function action(){
    $data = array(
'username' => $this->input->post('username',TRUE),
'password' => md5($this->input->post('password',TRUE)),
'nama' => $this->input->post('nama',TRUE),
'email' => $this->input->post('email',TRUE),
'alamat' => $this->input->post('alamat',TRUE),
'jenis_kelamin' => $this->input->post('jenis_kelamin',TRUE),
'tanggal_lahir' => $this->input->post('tanggal_lahir',TRUE),
'file_ktp' => $this->input->post('file_ktp',TRUE),
);

      $where = array('username' => $this->input->post('username',TRUE) );
      $sql = $this->Dbs->check("pemilik_wisata",$where);
      $check=$sql->num_rows();
  		if($check > 0){
        $this->session->set_flashdata('errorMessage', 'Username sudah pernah dipakai,silahkan gunakan username lain');
        redirect(base_url('register'));
  		}else{
        $this->MPemilik_wisata->insert($data);
        $this->session->set_flashdata('flashMessage', 'Pendaftaran Berhasil, Silahkan Menunggu Persetujuan Admin Dinas');
      redirect(site_url('login'));
  		}

  }



}
