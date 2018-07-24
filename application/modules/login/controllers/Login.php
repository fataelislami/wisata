<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Login extends MY_Controller{

  public function __construct()
  {
    parent::__construct();
    //Codeigniter : Write Less Do More
    $this->load->model(array('Dbs'));
  }

  function index()
  {
    $this->load->view('vLogin');
  }

  function auth(){//Proses pengecekan login
    $username = $this->input->post('username');
		$password = $this->input->post('password');
		$where = array(
			'username' => $username,
			'password' => md5($password)
			);
		if($this->Dbs->check("superadmin",$where)->num_rows()>0){
      $sql=$this->Dbs->check("superadmin",$where);
      $getdatauser=$sql->result();
      $name=$getdatauser[0]->nama;
      $level=$getdatauser[0]->level;
			$data_session = array(//Data yang akan disimpan kedalam session
				'username' => $username,
        'name'=>$name,
				'status' => "login",
        'role'=> 1,
        'level'=>$level
				);

			$this->session->set_userdata($data_session);
        redirect(base_url("admin"));

		}else if($this->Dbs->check("admin_dinas",$where)->num_rows()>0)
    {
      $sql=$this->Dbs->check("admin_dinas",$where);
      $getdatauser=$sql->result();
      $name=$getdatauser[0]->nama;
      $level=$getdatauser[0]->level;
			$data_session = array(//Data yang akan disimpan kedalam session
				'username' => $username,
        'name'=>$name,
				'status' => "login",
        'role'=> 2,
        'level'=>$level
				);

			$this->session->set_userdata($data_session);
        redirect(base_url("dinas"));
		}else if($this->Dbs->check("pemilik_wisata",$where)->num_rows()>0)
    {
      $sql=$this->Dbs->check("pemilik_wisata",$where);
      $getdatauser=$sql->result();
      $name=$getdatauser[0]->nama;
      $level=$getdatauser[0]->level;
			$data_session = array(//Data yang akan disimpan kedalam session
				'username' => $username,
        'name'=>$name,
				'status' => "login",
        'role'=> 3,
        'level'=>$level
				);

			$this->session->set_userdata($data_session);
        redirect(base_url("pemilik_wisata"));
		}else{
      $data=array('errorMessage'=>'Username dan Password salah');
      redirect(base_url('login'));
    }
  }


  function logout(){
		$this->session->sess_destroy();
		redirect(base_url('login'));
	}

}
