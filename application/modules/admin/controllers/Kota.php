<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Kota extends MY_Controller
{
    function __construct()
    {
        parent::__construct();
        $this->load->model('MKota');
        $this->load->library('form_validation');
    }

    public function index()
    {

      $datakota=$this->MKota->get_all();//panggil ke modell
      $datafield=$this->MKota->get_field();//panggil ke modell

      $data = array(
        'contain_view' => 'admin/kota/kota_list',
        'sidebar'=>'admin/sidebar',
        'css'=>'admin/crudassets/css',
        'script'=>'admin/crudassets/script',
        'datakota'=>$datakota,
        'datafield'=>$datafield,
        'module'=>'admin'
       );
      $this->template->load($data);
    }


    public function create(){
      $data = array(
        'contain_view' => 'admin/kota/kota_form',
        'sidebar'=>'admin/sidebar',//Ini buat menu yang ditampilkan di module admin {DIKIRIM KE TEMPLATE}
        'css'=>'admin/crudassets/css',//Ini buat kirim css dari page nya  {DIKIRIM KE TEMPLATE}
        'script'=>'admin/crudassets/script',//ini buat javascript apa aja yang di load di page {DIKIRIM KE TEMPLATE}
        'action'=>'admin/kota/create_action'
       );
      $this->template->load($data);
    }

    public function edit($id){
      $dataedit=$this->MKota->get_by_id($id);
      $data = array(
        'contain_view' => 'admin/kota/kota_edit',
        'sidebar'=>'admin/sidebar',//Ini buat menu yang ditampilkan di module admin {DIKIRIM KE TEMPLATE}
        'css'=>'admin/crudassets/css',//Ini buat kirim css dari page nya  {DIKIRIM KE TEMPLATE}
        'script'=>'admin/crudassets/script',//ini buat javascript apa aja yang di load di page {DIKIRIM KE TEMPLATE}
        'action'=>'admin/kota/update_action',
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
	    );

            $this->MKota->insert($data);
            $this->session->set_flashdata('message', 'Create Record Success');
            redirect(site_url('admin/kota'));
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
	    );

            $this->MKota->update($this->input->post('id', TRUE), $data);
            $this->session->set_flashdata('message', 'Update Record Success');
            redirect(site_url('admin/kota'));
        }
    }

    public function delete($id)
    {
        $row = $this->MKota->get_by_id($id);

        if ($row) {
            $this->MKota->delete($id);
            $this->session->set_flashdata('message', 'Delete Record Success');
            redirect(site_url('admin/kota'));
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('admin/kota'));
        }
    }

    public function _rules()
    {
	$this->form_validation->set_rules('nama', 'nama', 'trim|required');

	$this->form_validation->set_rules('id', 'id', 'trim');
	$this->form_validation->set_error_delimiters('<span class="text-danger">', '</span>');
    }

}
