<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Kecamatan extends MY_Controller
{
    function __construct()
    {
        parent::__construct();
        $this->load->model('MKecamatan');
        $this->load->library('form_validation');
    }

    public function index()
    {

      $datakecamatan=$this->MKecamatan->get_all();//panggil ke modell
      $datafield=$this->MKecamatan->get_field();//panggil ke modell

      $data = array(
        'contain_view' => 'admin/kecamatan/kecamatan_list',
        'sidebar'=>'admin/sidebar',
        'css'=>'admin/crudassets/css',
        'script'=>'admin/crudassets/script',
        'datakecamatan'=>$datakecamatan,
        'datafield'=>$datafield,
        'module'=>'admin'
       );
      $this->template->load($data);
    }


    public function create(){
      $data = array(
        'contain_view' => 'admin/kecamatan/kecamatan_form',
        'sidebar'=>'admin/sidebar',//Ini buat menu yang ditampilkan di module admin {DIKIRIM KE TEMPLATE}
        'css'=>'admin/crudassets/css',//Ini buat kirim css dari page nya  {DIKIRIM KE TEMPLATE}
        'script'=>'admin/crudassets/script',//ini buat javascript apa aja yang di load di page {DIKIRIM KE TEMPLATE}
        'action'=>'admin/kecamatan/create_action'
       );
      $this->template->load($data);
    }

    public function edit($id){
      $dataedit=$this->MKecamatan->get_by_id($id);
      $data = array(
        'contain_view' => 'admin/kecamatan/kecamatan_edit',
        'sidebar'=>'admin/sidebar',//Ini buat menu yang ditampilkan di module admin {DIKIRIM KE TEMPLATE}
        'css'=>'admin/crudassets/css',//Ini buat kirim css dari page nya  {DIKIRIM KE TEMPLATE}
        'script'=>'admin/crudassets/script',//ini buat javascript apa aja yang di load di page {DIKIRIM KE TEMPLATE}
        'action'=>'admin/kecamatan/update_action',
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
		'id_kota' => $this->input->post('id_kota',TRUE),
	    );

            $this->MKecamatan->insert($data);
            $this->session->set_flashdata('message', 'Create Record Success');
            redirect(site_url('admin/kecamatan'));
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
            redirect(site_url('admin/kecamatan'));
        }
    }

    public function delete($id)
    {
        $row = $this->MKecamatan->get_by_id($id);

        if ($row) {
            $this->MKecamatan->delete($id);
            $this->session->set_flashdata('message', 'Delete Record Success');
            redirect(site_url('admin/kecamatan'));
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('admin/kecamatan'));
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
