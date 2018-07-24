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
        'contain_view' => '{namamodule}/kecamatan/kecamatan_list',
        'sidebar'=>'{namamodule}/sidebar',
        'css'=>'{namamodule}/crudassets/css',
        'script'=>'{namamodule}/crudassets/script',
        'datakecamatan'=>$datakecamatan,
        'datafield'=>$datafield,
        'module'=>'{namamodule}'
       );
      $this->template->load($data);
    }


    public function create(){
      $data = array(
        'contain_view' => '{namamodule}/kecamatan/kecamatan_form',
        'sidebar'=>'{namamodule}/sidebar',//Ini buat menu yang ditampilkan di module admin {DIKIRIM KE TEMPLATE}
        'css'=>'{namamodule}/crudassets/css',//Ini buat kirim css dari page nya  {DIKIRIM KE TEMPLATE}
        'script'=>'{namamodule}/crudassets/script',//ini buat javascript apa aja yang di load di page {DIKIRIM KE TEMPLATE}
        'action'=>'{namamodule}/kecamatan/create_action'
       );
      $this->template->load($data);
    }

    public function edit($id){
      $dataedit=$this->MKecamatan->get_by_id($id);
      $data = array(
        'contain_view' => '{namamodule}/kecamatan/kecamatan_edit',
        'sidebar'=>'{namamodule}/sidebar',//Ini buat menu yang ditampilkan di module admin {DIKIRIM KE TEMPLATE}
        'css'=>'{namamodule}/crudassets/css',//Ini buat kirim css dari page nya  {DIKIRIM KE TEMPLATE}
        'script'=>'{namamodule}/crudassets/script',//ini buat javascript apa aja yang di load di page {DIKIRIM KE TEMPLATE}
        'action'=>'{namamodule}/kecamatan/update_action',
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
		'id_kota' => $this->input->post('id_kota',TRUE),
	    );

            $this->MKecamatan->insert($data);
            $this->session->set_flashdata('message', 'Create Record Success');
            redirect(site_url('{namamodule}/kecamatan'));
        }
    }



    public function update_action()
    {
        $this->_rules();

        if ($this->form_validation->run() == FALSE) {
            $this->edit($this->input->post('id', TRUE));
        } else {
            $data = array(
		'id_kota' => $this->input->post('id_kota',TRUE),
	    );

            $this->MKecamatan->update($this->input->post('id', TRUE), $data);
            $this->session->set_flashdata('message', 'Update Record Success');
            redirect(site_url('{namamodule}/kecamatan'));
        }
    }

    public function delete($id)
    {
        $row = $this->MKecamatan->get_by_id($id);

        if ($row) {
            $this->MKecamatan->delete($id);
            $this->session->set_flashdata('message', 'Delete Record Success');
            redirect(site_url('{namamodule}/kecamatan'));
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('{namamodule}/kecamatan'));
        }
    }

    public function _rules()
    {
	$this->form_validation->set_rules('id_kota', 'id kota', 'trim|required');

	$this->form_validation->set_rules('id', 'id', 'trim');
	$this->form_validation->set_error_delimiters('<span class="text-danger">', '</span>');
    }

}