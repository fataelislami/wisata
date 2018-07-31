<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Login extends MY_Controller{

  public function __construct()
  {
    parent::__construct();
    //Codeigniter : Write Less Do More
    $this->load->model(array('Dbs','MPemilik_wisata'));
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
        'id_kota'=>$id_kota,
        'id_user'=>$level.'_'.$id_admin_dinas
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
        $id_admin_dinas=$getdatauser[0]->id_admin_dinas;
        if($id_admin_dinas!=null){
          $create=1;
        }else{
          $create=0;
        }
  			$data_session = array(//Data yang akan disimpan kedalam session
  				'username' => $username,
          'name'=>$name,
  				'status' => "login",
          'role'=> 3,
          'level'=>$level,
          'id'=>$id_user,
          'create'=>$create,
          'id_user'=>$level.'_'.$id_user
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

  function reset(){
  $email=$this->input->post('email');
  $where = array(
    'email' => $email,
    );
  $sql = $this->Dbs->check("pemilik_wisata",$where);
  $check=$sql->num_rows();
  if($check > 0){
    $getdatauser=$sql->result();
    $passwordBaru="pwBaru".$this->randomPassword();
    $data = array(
      'password' => md5($passwordBaru)
    );
    $this->MPemilik_wisata->update_by_email($email,$data);
    $this->email("Info Reset Password Akun WISATA","Password Baru Anda : ".$passwordBaru,$email);
    $this->session->set_flashdata('flashMessage', 'Password baru telah terkirim,silahkan cek email anda');
    redirect(base_url('login'));
  }else{
    $this->session->set_flashdata('flashMessage', 'Email yang anda masukan belum pernah didaftarkan');
    redirect(base_url('login'));
  }

}

function randomPassword($length = 3) {
  $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
  $charactersLength = strlen($characters);
  $randomString = '';
  for ($i = 0; $i < $length; $i++) {
      $randomString .= $characters[rand(0, $charactersLength - 1)];
  }
  return $randomString;
}

public function email($subject,$isi,$emailtujuan){

$config['protocol'] = 'smtp';
$config['smtp_host'] = 'ssl://smtp.gmail.com';
$config['smtp_port'] = '465';
$config['smtp_user'] = 'shopagansta@gmail.com';
$config['smtp_pass'] = 'faztars123'; //ini pake akun pass google email
$config['mailtype'] = 'html';
$config['charset'] = 'iso-8859-1';
$config['wordwrap'] = 'TRUE';
$config['newline'] = "\r\n";

$this->load->library('email', $config);
$this->email->initialize($config);

$this->email->from('shopagansta@gmail.com');
$this->email->to($emailtujuan);
$this->email->subject($subject);
$this->email->message($isi);
$this->email->set_mailtype('html');
$this->email->send();
}


  function logout(){
		$this->session->sess_destroy();
		redirect(base_url('login'));
	}

}
