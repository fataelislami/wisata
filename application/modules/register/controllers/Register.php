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
    $ktp=$this->input->post('no_ktp',TRUE);
    $foto=$this->upload_foto('file_ktp');
    $data = array(
'username' => $this->input->post('email',TRUE),
'password' => md5($this->input->post('password',TRUE)),
'nama' => $this->input->post('nama',TRUE),
'email' => $this->input->post('email',TRUE),
'alamat' => $this->input->post('alamat',TRUE),
'jenis_kelamin' => $this->input->post('jenis_kelamin',TRUE),
'tanggal_lahir' => $this->input->post('tanggal_lahir',TRUE),
'no_ktp' => $this->input->post('no_ktp',TRUE),
'file_ktp' => $foto['file_name'],
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
        <a href='".base_url()."register/activate?ktp=$ktp'>Klik Disini Untuk Aktivasi Akun</a>",$this->input->post('email',TRUE));
        $this->session->set_flashdata('flashMessage', 'Pendaftaran Berhasil, Silahkan Cek Email Untuk Aktivasi Akun Anda');
      redirect(site_url('login'));
  		}

  }

  function activate(){
      $ktp=$_GET['ktp'];
      $data['status']='aktif';
      $this->MPemilik_wisata->update_by_ktp($ktp,$data);
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

public function upload_foto($formname){
$config['upload_path']          = './upload_area/pemilik_wisata';
$config['allowed_types']        = 'gif|jpg|png|jpeg';
$config['encrypt_name'] = TRUE;
//$config['max_size']             = 100;
//$config['max_width']            = 1024;
//$config['max_height']           = 768;
$this->load->library('upload', $config);
$this->upload->do_upload($formname);
return $this->upload->data();

//Cara pemakaian untuk single
//hidupkan object terlebih dahulu
//misal
//$foto=$this->upload_foto('gambar');
//ambil $namafoto=$foto['file_name'];

//Cara pemakaian untuk multiple
// $limitLoop=sizeof($_FILES['gambar']['name']);
// for ($i=0; $i <$limitLoop ; $i++) {
//   $_FILES['file']['name']     = $_FILES['gambar']['name'][$i];
//   $_FILES['file']['type']     = $_FILES['gambar']['type'][$i];
//   $_FILES['file']['tmp_name'] = $_FILES['gambar']['tmp_name'][$i];
//   $_FILES['file']['error']     = $_FILES['gambar']['error'][$i];
//   $_FILES['file']['size']     = $_FILES['gambar']['size'][$i];
//   $foto=$this->upload_foto('file');
//   echo $foto['file_name'];
// }
}



}
