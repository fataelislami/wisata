<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Kelurahan extends MY_Controller
{
    function __construct()
    {
        parent::__construct();
        $this->load->model(array('Model_join','MKelurahan'));
        $this->load->library('form_validation');
    }

    public function index()
    {

      $datakelurahan=$this->Model_join->kelurahan_dan_kecamatan($this->session->userdata('id_kota'));//panggil ke modell
      // $datafield=$this->MKelurahan->get_field();//panggil ke modell

      $data = array(
        'contain_view' => 'dinas/kelurahan/kelurahan_list',
        'sidebar'=>'dinas/sidebar',
        'css'=>'dinas/crudassets/css',
        'script'=>'dinas/crudassets/script',
        'datakelurahan'=>$datakelurahan,
        'module'=>'dinas'
       );
      $this->template->load($data);
    }


    public function create(){
      $datakecamatan=$this->Model_join->kelurahan_dan_kecamatan_distinct($this->session->userdata('id_kota'));
      $data = array(
        'contain_view' => 'dinas/kelurahan/kelurahan_form',
        'sidebar'=>'dinas/sidebar',//Ini buat menu yang ditampilkan di module admin {DIKIRIM KE TEMPLATE}
        'css'=>'dinas/crudassets/css',//Ini buat kirim css dari page nya  {DIKIRIM KE TEMPLATE}
        'script'=>'dinas/crudassets/script',//ini buat javascript apa aja yang di load di page {DIKIRIM KE TEMPLATE}
        'action'=>'dinas/kelurahan/create_action',
        'datakecamatan'=>$datakecamatan
       );
      $this->template->load($data);
    }

    public function edit($id){
      $dataedit=$this->MKelurahan->get_by_id($id);
      $data = array(
        'contain_view' => 'dinas/kelurahan/kelurahan_edit',
        'sidebar'=>'dinas/sidebar',//Ini buat menu yang ditampilkan di module admin {DIKIRIM KE TEMPLATE}
        'css'=>'dinas/crudassets/css',//Ini buat kirim css dari page nya  {DIKIRIM KE TEMPLATE}
        'script'=>'dinas/crudassets/script',//ini buat javascript apa aja yang di load di page {DIKIRIM KE TEMPLATE}
        'action'=>'dinas/kelurahan/update_action',
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
		'id_kecamatan' => $this->input->post('id_kecamatan',TRUE),
	    );

            $this->MKelurahan->insert($data);
            $this->session->set_flashdata('message', 'Create Record Success');
            redirect(site_url('dinas/kelurahan'));
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
		'id_kecamatan' => $this->input->post('id_kecamatan',TRUE),
	    );

            $this->MKelurahan->update($this->input->post('id', TRUE), $data);
            $this->session->set_flashdata('message', 'Update Record Success');
            redirect(site_url('dinas/kelurahan'));
        }
    }

    public function delete($id)
    {
        $row = $this->MKelurahan->get_by_id($id);

        if ($row) {
            $this->MKelurahan->delete($id);
            $this->session->set_flashdata('message', 'Delete Record Success');
            redirect(site_url('dinas/kelurahan'));
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('dinas/kelurahan'));
        }
    }

    public function _rules()
    {
	$this->form_validation->set_rules('nama', 'nama', 'trim|required');
	$this->form_validation->set_rules('id_kecamatan', 'id kecamatan', 'trim|required');

	$this->form_validation->set_rules('id', 'id', 'trim');
	$this->form_validation->set_error_delimiters('<span class="text-danger">', '</span>');
    }

}
