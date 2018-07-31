<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Profile extends MY_Controller{

  public function __construct()
  {
    parent::__construct();
    $this->load->model(array('MPemilik_wisata'));
    //Codeigniter : Write Less Do More
  }

  function index()
  {
    if(isset($_GET['id'])){
      $getProfile=$this->MPemilik_wisata->get_by_id($_GET['id']);
      $data = array(
        'contain_view' => 'pemilik_wisata/profile/vProfile',
        'sidebar'=>'pemilik_wisata/sidebar',//Ini buat menu yang ditampilkan di module admin {DIKIRIM KE TEMPLATE}
        'css'=>'pemilik_wisata/assets/css',//Ini buat kirim css dari page nya  {DIKIRIM KE TEMPLATE}
        'script'=>'pemilik_wisata/assets/script',//ini buat javascript apa aja yang di load di page {DIKIRIM KE TEMPLATE}
        'nama'=>'Pemilik_wisata',//ngirim variable ke view yang ada di module admin {DIKIRIM KE VIEW ADMIN}
        'getProfile'=>$getProfile
       );
      // $this->load->view('home_v', $data);
      $this->template->load($data);
    }
  }

  function updateaction(){
    if($_POST['password']!=''){
      $data=array(
        'nama'=>$this->input->post('nama'),
        'email'=>$this->input->post('email'),
        'password'=>md5($this->input->post('password')),
        'alamat'=>$this->input->post('alamat'),
        'no_ktp'=>$this->input->post('no_ktp')

      );
      if($_FILES['file_ktp']['name']!=''){//pengecekan
        $foto=$this->upload_foto('file_ktp');
        $data['file_ktp']=$foto['file_name'];
      }
    }else{
      $data=array(
        'nama'=>$this->input->post('nama'),
        'email'=>$this->input->post('email'),
        'alamat'=>$this->input->post('alamat'),
        'no_ktp'=>$this->input->post('no_ktp')
      );
      if($_FILES['file_ktp']['name']!=''){//pengecekan
        $foto=$this->upload_foto('file_ktp');
        $data['file_ktp']=$foto['file_name'];
      }
    }

    $this->MPemilik_wisata->update($this->session->userdata('id'),$data);
    redirect(site_url('pemilik_wisata/profile?id='.$this->session->userdata('id')));

  }

  public function upload_foto($formname){
  $config['upload_path']          = './upload_area/pemilik_wisata';
  $config['allowed_types']        = 'gif|jpg|png|jpeg';
  $config['encrypt_name'] = FALSE;
  //$config['max_size']             = 100;
  //$config['max_width']            = 1024;
  //$config['max_height']           = 768;
  $this->load->library('upload', $config);
  $this->upload->do_upload($formname);
  return $this->upload->data();

  }

}
