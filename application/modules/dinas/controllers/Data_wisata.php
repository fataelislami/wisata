<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Data_wisata extends MY_Controller
{
    function __construct()
    {
        parent::__construct();
        $this->load->model('Data_wisata_model');
        $this->load->library('form_validation');
    }

    public function index()
    {

      $datadata_wisata=$this->Data_wisata_model->get_all();//panggil ke modell
      $datafield=$this->Data_wisata_model->get_field();//panggil ke modell

      $data = array(
        'contain_view' => 'dinas/data_wisata/data_wisata_list',
        'sidebar'=>'dinas/sidebar',
        'css'=>'dinas/crudassets/css',
        'script'=>'dinas/crudassets/script',
        'datadata_wisata'=>$datadata_wisata,
        'datafield'=>$datafield,
        'module'=>'dinas'
       );
      $this->template->load($data);
    }


    public function create(){
      $data = array(
        'contain_view' => 'dinas/data_wisata/data_wisata_form',
        'sidebar'=>'dinas/sidebar',//Ini buat menu yang ditampilkan di module admin {DIKIRIM KE TEMPLATE}
        'css'=>'dinas/data_wisata/assets/css',//Ini buat kirim css dari page nya  {DIKIRIM KE TEMPLATE}
        'script'=>'dinas/data_wisata/assets/script',//ini buat javascript apa aja yang di load di page {DIKIRIM KE TEMPLATE}
        'action'=>'dinas/data_wisata/create_action'
       );
      $this->template->load($data);
    }

    public function edit($id){
      $dataedit=$this->Data_wisata_model->get_by_id($id);
      $data = array(
        'contain_view' => 'dinas/data_wisata/data_wisata_edit',
        'sidebar'=>'dinas/sidebar',//Ini buat menu yang ditampilkan di module admin {DIKIRIM KE TEMPLATE}
        'css'=>'dinas/crudassets/css',//Ini buat kirim css dari page nya  {DIKIRIM KE TEMPLATE}
        'script'=>'dinas/crudassets/script',//ini buat javascript apa aja yang di load di page {DIKIRIM KE TEMPLATE}
        'action'=>'dinas/data_wisata/update_action',
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
		'id_user' => $this->input->post('id_user',TRUE),
		'safe_delete' => $this->input->post('safe_delete',TRUE),
		'no_telp' => $this->input->post('no_telp',TRUE),
		'htm_dewasa' => $this->input->post('htm_dewasa',TRUE),
		'htm_anak' => $this->input->post('htm_anak',TRUE),
	    );

            $this->Data_wisata_model->insert($data);
            $this->session->set_flashdata('message', 'Create Record Success');
            redirect(site_url('dinas/data_wisata'));
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
		'id_user' => $this->input->post('id_user',TRUE),
		'safe_delete' => $this->input->post('safe_delete',TRUE),
		'no_telp' => $this->input->post('no_telp',TRUE),
		'htm_dewasa' => $this->input->post('htm_dewasa',TRUE),
		'htm_anak' => $this->input->post('htm_anak',TRUE),
	    );

            $this->Data_wisata_model->update($this->input->post('id', TRUE), $data);
            $this->session->set_flashdata('message', 'Update Record Success');
            redirect(site_url('dinas/data_wisata'));
        }
    }

    public function delete($id)
    {
        $row = $this->Data_wisata_model->get_by_id($id);

        if ($row) {
            $this->Data_wisata_model->delete($id);
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
	$this->form_validation->set_rules('id_user', 'id user', 'trim|required');
	$this->form_validation->set_rules('safe_delete', 'safe delete', 'trim|required');
	$this->form_validation->set_rules('no_telp', 'no telp', 'trim|required');
	$this->form_validation->set_rules('htm_dewasa', 'htm dewasa', 'trim|required');
	$this->form_validation->set_rules('htm_anak', 'htm anak', 'trim|required');

	$this->form_validation->set_rules('id', 'id', 'trim');
	$this->form_validation->set_error_delimiters('<span class="text-danger">', '</span>');
    }

}
