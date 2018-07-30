<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Data_wisata extends MY_Controller
{
    function __construct()
    {
        parent::__construct();
        $this->load->model('Data_wisata_model');
        $this->load->model(array('Dbs'));
        $this->load->library('form_validation');
    }

    public function index()
    {

      $datadata_wisata=$this->Data_wisata_model->get_by_id_user($this->session->userdata('id_user'));//panggil ke modell
      $datafield=$this->Data_wisata_model->get_field();//panggil ke modell

      $data = array(
        'contain_view' => 'pemilik_wisata/data_wisata/data_wisata_list',
        'sidebar'=>'pemilik_wisata/sidebar',
        'css'=>'pemilik_wisata/crudassets/css',
        'script'=>'pemilik_wisata/crudassets/script',
        'datadata_wisata'=>$datadata_wisata,
        'datafield'=>$datafield,
        'module'=>'pemilik_wisata'
       );
      $this->template->load($data);
    }


    public function create(){
      if($this->session->userdata('create')!=0){
        $polygon1=$this->Dbs->getwhere('id_polygon',1,'polygon')->row()->coordinate;
        $polygon2=$this->Dbs->getwhere('id_polygon',2,'polygon')->row()->coordinate;
        $polygon3=$this->Dbs->getwhere('id_polygon',3,'polygon')->row()->coordinate;
        $polygon4=$this->Dbs->getwhere('id_polygon',4,'polygon')->row()->coordinate;

        $data = array(
          'contain_view' => 'pemilik_wisata/data_wisata/data_wisata_form',
          'sidebar'=>'pemilik_wisata/sidebar',//Ini buat menu yang ditampilkan di module admin {DIKIRIM KE TEMPLATE}
          'css'=>'pemilik_wisata/data_wisata/assets/css',//Ini buat kirim css dari page nya  {DIKIRIM KE TEMPLATE}
          'script'=>'pemilik_wisata/data_wisata/assets/script',//ini buat javascript apa aja yang di load di page {DIKIRIM KE TEMPLATE}
          'action'=>'pemilik_wisata/data_wisata/create_action',
          'polygon1'=>$polygon1,
          'polygon2'=>$polygon2,
          'polygon3'=>$polygon3,
          'polygon4'=>$polygon4,
         );
        $this->template->load($data);
      }else{
        $this->session->set_flashdata('message', 'Akses Ditolak! Anda Belum Di Aktivasi oleh admin dinas');
        redirect(site_url('pemilik_wisata'));
      }

    }

//COPY INI KALO MAU MULTIPLE UPLOAD
    public function getupload()
    {
      $id_wisata=$this->Dbs->id_wisata()->id;
      echo $id_wisata+1;
      $limitLoop=sizeof($_FILES['gambar']['name']);
      for ($i=0; $i <$limitLoop ; $i++) {
        $_FILES['file']['name']     = $_FILES['gambar']['name'][$i];
        $_FILES['file']['type']     = $_FILES['gambar']['type'][$i];
        $_FILES['file']['tmp_name'] = $_FILES['gambar']['tmp_name'][$i];
        $_FILES['file']['error']     = $_FILES['gambar']['error'][$i];
        $_FILES['file']['size']     = $_FILES['gambar']['size'][$i];
        $foto=$this->upload_foto('file');
        echo $foto['file_name'];
      }
    }
    //COPY INI KALO MAU MULTIPLE UPLOAD


    public function upload_foto($formname){
    $config['upload_path']          = './upload_area/gambar_wisata';
    $config['allowed_types']        = 'gif|jpg|png|jpeg';
    $config['encrypt_name'] = FALSE;
    //$config['max_size']             = 100;
    //$config['max_width']            = 1024;
    //$config['max_height']           = 768;
    $this->load->library('upload', $config);
    $this->upload->do_upload($formname);
    return $this->upload->data();

    }



    public function edit($id){
      $dataedit=$this->Data_wisata_model->get_by_id($id);
      $polygon1=$this->Dbs->getwhere('id_polygon',1,'polygon')->row()->coordinate;
      $polygon2=$this->Dbs->getwhere('id_polygon',2,'polygon')->row()->coordinate;
      $polygon3=$this->Dbs->getwhere('id_polygon',3,'polygon')->row()->coordinate;
      $polygon4=$this->Dbs->getwhere('id_polygon',4,'polygon')->row()->coordinate;
      $data = array(
        'contain_view' => 'pemilik_wisata/data_wisata/data_wisata_edit',
        'sidebar'=>'pemilik_wisata/sidebar',//Ini buat menu yang ditampilkan di module admin {DIKIRIM KE TEMPLATE}
        'css'=>'pemilik_wisata/crudassets/css',//Ini buat kirim css dari page nya  {DIKIRIM KE TEMPLATE}
        'script'=>'pemilik_wisata/data_wisata/assets/scriptEdit',//ini buat javascript apa aja yang di load di page {DIKIRIM KE TEMPLATE}
        'action'=>'pemilik_wisata/data_wisata/update_action',
        'dataedit'=>$dataedit,
        'polygon1'=>$polygon1,
        'polygon2'=>$polygon2,
        'polygon3'=>$polygon3,
        'polygon4'=>$polygon4,
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
		'nama' => $this->input->post('nama',TRUE),
		'lat' => $this->input->post('lat',TRUE),
		'lang' => $this->input->post('lang',TRUE),
		'alamat' => $this->input->post('alamat',TRUE),
		'keterangan' => $this->input->post('keterangan',TRUE),
		'harga_tiket' => $this->input->post('harga_tiket',TRUE),
		'peta_marker' => $this->input->post('peta_marker',TRUE),
		'id_kota' => $this->input->post('id_kota',TRUE),
		'id_kecamatan' => $this->input->post('id_kecamatan',TRUE),
		'id_kelurahan' => $this->input->post('id_kelurahan',TRUE),
		'id_user' => $this->session->userdata('id_user'),
		'no_telp' => $this->input->post('no_telp',TRUE),
		'htm_dewasa' => $this->input->post('htm_dewasa',TRUE),
		'htm_anak' => $this->input->post('htm_anak',TRUE),
	    );


              $sql=$this->Dbs->insert($data,'data_wisata');
              if($sql){
                $id_wisata=$this->Dbs->id_wisata()->id;
                $limitLoop=sizeof($_FILES['gambar']['name']);
                if($limitLoop!=0){
                  for ($i=0; $i <$limitLoop ; $i++) {
                    $_FILES['file']['name']     = $_FILES['gambar']['name'][$i];
                    $_FILES['file']['type']     = $_FILES['gambar']['type'][$i];
                    $_FILES['file']['tmp_name'] = $_FILES['gambar']['tmp_name'][$i];
                    $_FILES['file']['error']     = $_FILES['gambar']['error'][$i];
                    $_FILES['file']['size']     = $_FILES['gambar']['size'][$i];
                    $foto=$this->upload_foto('file');
                    $dataFoto=array(
                      'url'=>$foto['file_name'],
                      'id_wisata'=>$id_wisata
                    );
                    if($_FILES['gambar']['name'][0]!=''){//pengecekan
                      $this->Dbs->insert($dataFoto,'gambar');
                    }
                  }
                }
              }            //MULTIPLE UPLOAD START


            //MULTIPLE UPLOAD END

            $this->session->set_flashdata('message', 'Create Record Success');
            redirect(site_url('pemilik_wisata/data_wisata'));
        }
    }



    public function update_action()
    {
        $this->_rules();

        if ($this->form_validation->run() == FALSE) {
            $this->edit($this->input->post('id', TRUE));
        } else {
            $data = array(
		'nama' => $this->input->post('nama',TRUE),
		'lat' => $this->input->post('lat',TRUE),
		'lang' => $this->input->post('lang',TRUE),
		'alamat' => $this->input->post('alamat',TRUE),
		'keterangan' => $this->input->post('keterangan',TRUE),
		'harga_tiket' => $this->input->post('harga_tiket',TRUE),
		'peta_marker' => $this->input->post('peta_marker',TRUE),
		'id_kota' => $this->input->post('id_kota',TRUE),
		'id_kecamatan' => $this->input->post('id_kecamatan',TRUE),
		'id_kelurahan' => $this->input->post('id_kelurahan',TRUE),
		'id_user' => $this->session->userdata('id_user'),
		'no_telp' => $this->input->post('no_telp',TRUE),
		'htm_dewasa' => $this->input->post('htm_dewasa',TRUE),
		'htm_anak' => $this->input->post('htm_anak',TRUE),
	    );

            $this->Data_wisata_model->update($this->input->post('id', TRUE), $data);
            //MULTIPLE UPLOAD START
            $id_wisata=$this->input->post('id', TRUE);
            $limitLoop=sizeof($_FILES['gambar']['name']);
            if($limitLoop!=0){
              for ($i=0; $i <$limitLoop ; $i++) {
                $_FILES['file']['name']     = $_FILES['gambar']['name'][$i];
                $_FILES['file']['type']     = $_FILES['gambar']['type'][$i];
                $_FILES['file']['tmp_name'] = $_FILES['gambar']['tmp_name'][$i];
                $_FILES['file']['error']     = $_FILES['gambar']['error'][$i];
                $_FILES['file']['size']     = $_FILES['gambar']['size'][$i];
                $foto=$this->upload_foto('file');
                $dataFoto=array(
                  'url'=>$foto['file_name'],
                  'id_wisata'=>$id_wisata
                );
                if($_FILES['gambar']['name'][0]!=''){//pengecekan
                  $this->Dbs->insert($dataFoto,'gambar');
                }
              }
            }

            //MULTIPLE UPLOAD END
            $this->session->set_flashdata('message', 'Update Record Success');
            redirect(site_url('pemilik_wisata/data_wisata'));
        }
    }

    public function delete($id)
    {
        $row = $this->Data_wisata_model->get_by_id($id);

        if ($row) {
            $this->Data_wisata_model->delete($id);
            $this->session->set_flashdata('message', 'Delete Record Success');
            redirect(site_url('pemilik_wisata/data_wisata'));
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('pemilik_wisata/data_wisata'));
        }
    }

    public function safe_delete($id){
      $row = $this->Data_wisata_model->get_by_id($id);
      if ($row) {
        $data=array('safe_delete'=>1);
          $this->Data_wisata_model->safe_delete($id,$data);
          $this->session->set_flashdata('message', 'Delete Record Success');
          redirect(site_url('dinas/data_wisata'));
      } else {
          $this->session->set_flashdata('message', 'Record Not Found');
          redirect(site_url('dinas/data_wisata'));
      }
    }

    public function _rules()
    {
	$this->form_validation->set_rules('nama', 'nama', 'trim|required');
	$this->form_validation->set_rules('lat', 'lat', 'trim|required|numeric');
	$this->form_validation->set_rules('lang', 'lang', 'trim|required|numeric');
	$this->form_validation->set_rules('alamat', 'alamat', 'trim|required');
	$this->form_validation->set_rules('keterangan', 'keterangan', 'trim|required');
	$this->form_validation->set_rules('harga_tiket', 'harga tiket', 'trim|required');
	$this->form_validation->set_rules('peta_marker', 'peta marker', 'trim|required');
	$this->form_validation->set_rules('id_kota', 'id kota', 'trim|required');
	$this->form_validation->set_rules('id_kecamatan', 'id kecamatan', 'trim|required');
	$this->form_validation->set_rules('id_kelurahan', 'id kelurahan', 'trim|required');
	$this->form_validation->set_rules('no_telp', 'no telp', 'trim|required');
	$this->form_validation->set_rules('htm_dewasa', 'htm dewasa', 'trim|required');
	$this->form_validation->set_rules('htm_anak', 'htm anak', 'trim|required');

	$this->form_validation->set_rules('id', 'id', 'trim');
	$this->form_validation->set_error_delimiters('<span class="text-danger">', '</span>');
    }

}
