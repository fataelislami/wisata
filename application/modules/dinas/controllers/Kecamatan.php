<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Kecamatan extends MY_Controller
{
    function __construct()
    {
        parent::__construct();
        $this->load->model(array('MKecamatan','MKota'));
        $this->load->library('form_validation');
    }

    public function index()
    {

      $datakecamatan=$this->MKecamatan->get_by_kota($this->session->userdata('id_kota'));//panggil ke modell
      $datafield=$this->MKecamatan->get_field();//panggil ke modell

      $data = array(
        'contain_view' => 'dinas/kecamatan/kecamatan_list',
        'sidebar'=>'dinas/sidebar',
        'css'=>'dinas/crudassets/css',
        'script'=>'dinas/crudassets/script',
        'datakecamatan'=>$datakecamatan,
        'datafield'=>$datafield,
        'module'=>'dinas'
       );
      $this->template->load($data);
    }


    public function create(){
      $data_kota=$this->MKota->get_by_id($this->session->userdata('id_kota'));
      $data = array(
        'contain_view' => 'dinas/kecamatan/kecamatan_form',
        'sidebar'=>'dinas/sidebar',//Ini buat menu yang ditampilkan di module admin {DIKIRIM KE TEMPLATE}
        'css'=>'dinas/crudassets/css',//Ini buat kirim css dari page nya  {DIKIRIM KE TEMPLATE}
        'script'=>'dinas/crudassets/script',//ini buat javascript apa aja yang di load di page {DIKIRIM KE TEMPLATE}
        'action'=>'dinas/kecamatan/create_action',
        'data_kota'=>$data_kota
       );
      $this->template->load($data);
    }

    public function edit($id){
      $dataedit=$this->MKecamatan->get_by_id($id);
      $data_kota=$this->MKota->get_by_id($this->session->userdata('id_kota'));
      $data = array(
        'contain_view' => 'dinas/kecamatan/kecamatan_edit',
        'sidebar'=>'dinas/sidebar',//Ini buat menu yang ditampilkan di module admin {DIKIRIM KE TEMPLATE}
        'css'=>'dinas/crudassets/css',//Ini buat kirim css dari page nya  {DIKIRIM KE TEMPLATE}
        'script'=>'dinas/crudassets/script',//ini buat javascript apa aja yang di load di page {DIKIRIM KE TEMPLATE}
        'action'=>'dinas/kecamatan/update_action',
        'dataedit'=>$dataedit,
        'data_kota'=>$data_kota
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
		'id_kota' => $this->input->post('id_kota',TRUE),
	    );

            $this->MKecamatan->insert($data);
            $this->session->set_flashdata('message', 'Create Record Success');
            redirect(site_url('dinas/kecamatan'));
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
		'id_kota' => $this->input->post('id_kota',TRUE),
	    );

            $this->MKecamatan->update($this->input->post('id', TRUE), $data);
            $this->session->set_flashdata('message', 'Update Record Success');
            redirect(site_url('dinas/kecamatan'));
        }
    }

    public function delete($id)
    {
        $row = $this->MKecamatan->get_by_id($id);

        if ($row) {
            $this->MKecamatan->delete($id);
            $this->session->set_flashdata('message', 'Delete Record Success');
            redirect(site_url('dinas/kecamatan'));
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('dinas/kecamatan'));
        }
    }

    public function _rules()
    {
	$this->form_validation->set_rules('nama', 'nama', 'trim|required');
	$this->form_validation->set_rules('id_kota', 'id kota', 'trim|required');

	$this->form_validation->set_rules('id', 'id', 'trim');
	$this->form_validation->set_error_delimiters('<span class="text-danger">', '</span>');
    }

}
