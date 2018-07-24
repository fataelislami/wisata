<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Kelurahan extends MY_Controller
{
    function __construct()
    {
        parent::__construct();
        $this->load->model('MKelurahan');
        $this->load->library('form_validation');
    }

    public function index()
    {

      $datakelurahan=$this->MKelurahan->get_all();//panggil ke modell
      $datafield=$this->MKelurahan->get_field();//panggil ke modell

      $data = array(
        'contain_view' => '{namamodule}/kelurahan/kelurahan_list',
        'sidebar'=>'{namamodule}/sidebar',
        'css'=>'{namamodule}/crudassets/css',
        'script'=>'{namamodule}/crudassets/script',
        'datakelurahan'=>$datakelurahan,
        'datafield'=>$datafield,
        'module'=>'{namamodule}'
       );
      $this->template->load($data);
    }


    public function create(){
      $data = array(
        'contain_view' => '{namamodule}/kelurahan/kelurahan_form',
        'sidebar'=>'{namamodule}/sidebar',//Ini buat menu yang ditampilkan di module admin {DIKIRIM KE TEMPLATE}
        'css'=>'{namamodule}/crudassets/css',//Ini buat kirim css dari page nya  {DIKIRIM KE TEMPLATE}
        'script'=>'{namamodule}/crudassets/script',//ini buat javascript apa aja yang di load di page {DIKIRIM KE TEMPLATE}
        'action'=>'{namamodule}/kelurahan/create_action'
       );
      $this->template->load($data);
    }

    public function edit($id){
      $dataedit=$this->MKelurahan->get_by_id($id);
      $data = array(
        'contain_view' => '{namamodule}/kelurahan/kelurahan_edit',
        'sidebar'=>'{namamodule}/sidebar',//Ini buat menu yang ditampilkan di module admin {DIKIRIM KE TEMPLATE}
        'css'=>'{namamodule}/crudassets/css',//Ini buat kirim css dari page nya  {DIKIRIM KE TEMPLATE}
        'script'=>'{namamodule}/crudassets/script',//ini buat javascript apa aja yang di load di page {DIKIRIM KE TEMPLATE}
        'action'=>'{namamodule}/kelurahan/update_action',
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
		'nama_kelurahan' => $this->input->post('nama_kelurahan',TRUE),
		'id_kecamatan' => $this->input->post('id_kecamatan',TRUE),
	    );

            $this->MKelurahan->insert($data);
            $this->session->set_flashdata('message', 'Create Record Success');
            redirect(site_url('{namamodule}/kelurahan'));
        }
    }



    public function update_action()
    {
        $this->_rules();

        if ($this->form_validation->run() == FALSE) {
            $this->edit($this->input->post('id', TRUE));
        } else {
            $data = array(
		'nama_kelurahan' => $this->input->post('nama_kelurahan',TRUE),
		'id_kecamatan' => $this->input->post('id_kecamatan',TRUE),
	    );

            $this->MKelurahan->update($this->input->post('id', TRUE), $data);
            $this->session->set_flashdata('message', 'Update Record Success');
            redirect(site_url('{namamodule}/kelurahan'));
        }
    }

    public function delete($id)
    {
        $row = $this->MKelurahan->get_by_id($id);

        if ($row) {
            $this->MKelurahan->delete($id);
            $this->session->set_flashdata('message', 'Delete Record Success');
            redirect(site_url('{namamodule}/kelurahan'));
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('{namamodule}/kelurahan'));
        }
    }

    public function _rules()
    {
	$this->form_validation->set_rules('nama_kelurahan', 'nama kelurahan', 'trim|required');
	$this->form_validation->set_rules('id_kecamatan', 'id kecamatan', 'trim|required');

	$this->form_validation->set_rules('id', 'id', 'trim');
	$this->form_validation->set_error_delimiters('<span class="text-danger">', '</span>');
    }

}