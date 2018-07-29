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
    $username=$this->input->post('username',TRUE);
    $data = array(
'username' => $this->input->post('username',TRUE),
'password' => md5($this->input->post('password',TRUE)),
'nama' => $this->input->post('nama',TRUE),
'email' => $this->input->post('email',TRUE),
'alamat' => $this->input->post('alamat',TRUE),
'jenis_kelamin' => $this->input->post('jenis_kelamin',TRUE),
'tanggal_lahir' => $this->input->post('tanggal_lahir',TRUE),
'no_ktp' => $this->input->post('no_ktp',TRUE),
'file_ktp' => $this->input->post('file_ktp',TRUE),
);

      $where = array('email' => $this->input->post('email',TRUE) );
      $sql = $this->Dbs->check("pemilik_wisata",$where);
      $check=$sql->num_rows();
  		if($check > 0){
        $this->session->set_flashdata('errorMessage', 'Email sudah pernah dipakai,silahkan gunakan email lain');
        redirect(base_url('register'));
  		}else{
        $this->MPemilik_wisata->insert($data);
        $this->email('Aktivasi Akun Wisata IF-11',"Silahkan klik link berikut untuk mengaktifkan akun <br>
        <a href='".base_url()."register/activate?username=$username'>Klik Disini Untuk Aktivasi Akun</a>",$this->input->post('email',TRUE));
        $this->session->set_flashdata('flashMessage', 'Pendaftaran Berhasil, Silahkan Cek Email Untuk Aktivasi Akun Anda');
      redirect(site_url('login'));
  		}

  }

  function activate(){
      $username=$_GET['username'];
      $data['status']='aktif';
      $this->MPemilik_wisata->update_by_username($username,$data);
      $this->session->set_flashdata('flashMessage', 'Aktivasi Berhasil, Silahkan Login');
      redirect(site_url('login'));

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



}
