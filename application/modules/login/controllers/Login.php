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
      $id_superadmin=$getdatauser[0]->id;
			$data_session = array(//Data yang akan disimpan kedalam session
				'username' => $username,
        'name'=>$name,
				'status' => "login",
        'role'=> 1,
        'level'=>$level,
        'id'=>$id_superadmin
				);

			$this->session->set_userdata($data_session);
        redirect(base_url("admin"));

		}else if($this->Dbs->check("admin_dinas",$where)->num_rows()>0)
    {
      $sql=$this->Dbs->check("admin_dinas",$where);
      $getdatauser=$sql->result();
      $name=$getdatauser[0]->nama;
      $level=$getdatauser[0]->level;
      $id_admin_dinas=$getdatauser[0]->id;
      $id_kota=$getdatauser[0]->kota;
			$data_session = array(//Data yang akan disimpan kedalam session
				'username' => $username,
        'name'=>$name,
				'status' => "login",
        'role'=> 2,
        'level'=>$level,
        'id'=>$id_admin_dinas,
        'id_kota'=>$id_kota
				);

			$this->session->set_userdata($data_session);
        redirect(base_url("dinas"));
		}else if($this->Dbs->check("pemilik_wisata",$where)->num_rows()>0)
    {
      $sql=$this->Dbs->check("pemilik_wisata",$where);
      $getdatauser=$sql->result();
      $status=$getdatauser[0]->status;
      if($status=='aktif'){
        $name=$getdatauser[0]->nama;
        $level=$getdatauser[0]->level;
        $id_user=$getdatauser[0]->id;

  			$data_session = array(//Data yang akan disimpan kedalam session
  				'username' => $username,
          'name'=>$name,
  				'status' => "login",
          'role'=> 3,
          'level'=>$level,
          'id'=>$id_user
  				);

  			$this->session->set_userdata($data_session);
          redirect(base_url("pemilik_wisata"));
      }else{
        $this->session->set_flashdata('flashMessage', 'Akun anda belum diaktifkan silahkan cek email');
          redirect(base_url("login"));
      }

		}else{
      $this->session->set_flashdata('flashMessage', 'Username dan Password Salah');
      redirect(base_url('login'));
    }
  }


  function logout(){
		$this->session->sess_destroy();
		redirect(base_url('login'));
	}

}
