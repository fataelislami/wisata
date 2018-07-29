<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Pemilik_wisata extends MY_Controller
{
    function __construct()
    {
        parent::__construct();
        $this->load->model('MPemilik_wisata');
        $this->load->library('form_validation');
    }

    public function index()
    {

      $datapemilik_wisata=$this->MPemilik_wisata->get_all();//panggil ke modell
      $datafield=$this->MPemilik_wisata->get_field();//panggil ke modell

      $data = array(
        'contain_view' => 'dinas/pemilik_wisata/pemilik_wisata_list',
        'sidebar'=>'dinas/sidebar',
        'css'=>'dinas/crudassets/css',
        'script'=>'dinas/crudassets/script',
        'datapemilik_wisata'=>$datapemilik_wisata,
        'datafield'=>$datafield,
        'module'=>'dinas'
       );
      $this->template->load($data);
    }


    public function create(){
      $data = array(
        'contain_view' => 'dinas/pemilik_wisata/pemilik_wisata_form',
        'sidebar'=>'dinas/sidebar',//Ini buat menu yang ditampilkan di module admin {DIKIRIM KE TEMPLATE}
        'css'=>'dinas/crudassets/css',//Ini buat kirim css dari page nya  {DIKIRIM KE TEMPLATE}
        'script'=>'dinas/crudassets/script',//ini buat javascript apa aja yang di load di page {DIKIRIM KE TEMPLATE}
        'action'=>'dinas/pemilik_wisata/create_action'
       );
      $this->template->load($data);
    }

    public function edit($id){
      $dataedit=$this->MPemilik_wisata->get_by_id($id);
      $data = array(
        'contain_view' => 'dinas/pemilik_wisata/pemilik_wisata_edit',
        'sidebar'=>'dinas/sidebar',//Ini buat menu yang ditampilkan di module admin {DIKIRIM KE TEMPLATE}
        'css'=>'dinas/crudassets/css',//Ini buat kirim css dari page nya  {DIKIRIM KE TEMPLATE}
        'script'=>'dinas/crudassets/script',//ini buat javascript apa aja yang di load di page {DIKIRIM KE TEMPLATE}
        'action'=>'dinas/pemilik_wisata/update_action',
        'dataedit'=>$dataedit
       );
      $this->template->load($data);
    }


    public function create_action()
    {
        $this->_rules();

        if ($this->form_validation->run() == FALSE) {
            $this->create();
        } else {
            $data = array(
		'username' => $this->input->post('email',TRUE),
		'password' => md5($this->input->post('password',TRUE)),
		'nama' => $this->input->post('nama',TRUE),
		'email' => $this->input->post('email',TRUE),
		'alamat' => $this->input->post('alamat',TRUE),
		'jenis_kelamin' => $this->input->post('jenis_kelamin',TRUE),
		'tanggal_lahir' => $this->input->post('tanggal_lahir',TRUE),
    'no_ktp' => $this->input->post('no_ktp',TRUE),
		'file_ktp' => $this->input->post('file_ktp',TRUE),
		'status' => $this->input->post('status',TRUE),
		'id_admin_dinas' => $this->session->userdata('id'),//mengambil id admin dinas dari session ketika login
	    );

            $this->MPemilik_wisata->insert($data);
            $this->session->set_flashdata('message', 'Create Record Success');
            redirect(site_url('dinas/pemilik_wisata'));
        }
    }



    public function update_action()
    {
        $this->_rules();

        if ($this->form_validation->run() == FALSE) {
            $this->edit($this->input->post('id', TRUE));
        } else {
          if($_POST['password']!=''){
            if($_POST['aktivasi']=='ya'){
              $id_admin_dinasi=$this->session->userdata('id');
            }else{
              $id_admin_dinasi=null;
            }
            $data = array(
        		'username' => $this->input->post('email',TRUE),
        		'password' => md5($this->input->post('password',TRUE)),
        		'nama' => $this->input->post('nama',TRUE),
        		'email' => $this->input->post('email',TRUE),
        		'alamat' => $this->input->post('alamat',TRUE),
        		'jenis_kelamin' => $this->input->post('jenis_kelamin',TRUE),
        		'tanggal_lahir' => $this->input->post('tanggal_lahir',TRUE),
            'no_ktp' => $this->input->post('no_ktp',TRUE),
        		'file_ktp' => $this->input->post('file_ktp',TRUE),
        		'status' => $this->input->post('status',TRUE),
            'id_admin_dinas' => $id_admin_dinasi,//mengambil id admin dinas dari session ketika login
        	    );
          }else{
            if($_POST['aktivasi']=='ya'){
              $this->email('Info Aktivasi Akun','Selamat Akun Anda Sudah Diaktifkan Oleh Admin Dinas',$this->input->post('email',TRUE));
              $id_admin_dinasi=$this->session->userdata('id');
            }else{
              $this->email('Info Aktivasi Akun','Akun Anda Di nonaktifkan Oleh Admin Dinas',$this->input->post('email',TRUE));
              $id_admin_dinasi=null;
            }
            $data = array(
		'username' => $this->input->post('email',TRUE),
		'nama' => $this->input->post('nama',TRUE),
		'email' => $this->input->post('email',TRUE),
		'alamat' => $this->input->post('alamat',TRUE),
		'jenis_kelamin' => $this->input->post('jenis_kelamin',TRUE),
		'tanggal_lahir' => $this->input->post('tanggal_lahir',TRUE),
    'no_ktp' => $this->input->post('no_ktp',TRUE),
		'file_ktp' => $this->input->post('file_ktp',TRUE),
		'status' => $this->input->post('status',TRUE),
    'id_admin_dinas' => $id_admin_dinasi,//mengambil id admin dinas dari session ketika login
	    );
          }




            $this->MPemilik_wisata->update($this->input->post('id', TRUE), $data);
            $this->session->set_flashdata('message', 'Update Record Success');
            redirect(site_url('dinas/pemilik_wisata'));
        }
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

    public function delete($id)
    {
        $row = $this->MPemilik_wisata->get_by_id($id);

        if ($row) {
            $this->MPemilik_wisata->delete($id);
            $this->session->set_flashdata('message', 'Delete Record Success');
            redirect(site_url('dinas/pemilik_wisata'));
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('dinas/pemilik_wisata'));
        }
    }

    public function _rules()
    {
	$this->form_validation->set_rules('nama', 'nama', 'trim|required');
	$this->form_validation->set_rules('email', 'email', 'trim|required');
	$this->form_validation->set_rules('alamat', 'alamat', 'trim|required');
	$this->form_validation->set_rules('jenis_kelamin', 'jenis kelamin', 'trim|required');
	$this->form_validation->set_rules('tanggal_lahir', 'tanggal lahir', 'trim|required');
	$this->form_validation->set_rules('file_ktp', 'file ktp', 'trim|required');
	$this->form_validation->set_rules('status', 'status', 'trim|required');

	$this->form_validation->set_rules('id', 'id', 'trim');
	$this->form_validation->set_error_delimiters('<span class="text-danger">', '</span>');
    }

}
