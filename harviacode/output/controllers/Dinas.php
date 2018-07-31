<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Dinas extends MY_Controller
{
    function __construct()
    {
        parent::__construct();
        $this->load->model('Admin_dinas_model');
        $this->load->library('form_validation');
    }

    public function index()
    {

      $datadinas=$this->Admin_dinas_model->get_all();//panggil ke modell
      $datafield=$this->Admin_dinas_model->get_field();//panggil ke modell

      $data = array(
        'contain_view' => '{namamodule}/dinas/admin_dinas_list',
        'sidebar'=>'{namamodule}/sidebar',
        'css'=>'{namamodule}/crudassets/css',
        'script'=>'{namamodule}/crudassets/script',
        'datadinas'=>$datadinas,
        'datafield'=>$datafield,
        'module'=>'{namamodule}'
       );
      $this->template->load($data);
    }


    public function create(){
      $data = array(
        'contain_view' => '{namamodule}/dinas/admin_dinas_form',
        'sidebar'=>'{namamodule}/sidebar',//Ini buat menu yang ditampilkan di module admin {DIKIRIM KE TEMPLATE}
        'css'=>'{namamodule}/crudassets/css',//Ini buat kirim css dari page nya  {DIKIRIM KE TEMPLATE}
        'script'=>'{namamodule}/crudassets/script',//ini buat javascript apa aja yang di load di page {DIKIRIM KE TEMPLATE}
        'action'=>'{namamodule}/dinas/create_action'
       );
      $this->template->load($data);
    }

    public function edit($id){
      $dataedit=$this->Admin_dinas_model->get_by_id($id);
      $data = array(
        'contain_view' => '{namamodule}/dinas/admin_dinas_edit',
        'sidebar'=>'{namamodule}/sidebar',//Ini buat menu yang ditampilkan di module admin {DIKIRIM KE TEMPLATE}
        'css'=>'{namamodule}/crudassets/css',//Ini buat kirim css dari page nya  {DIKIRIM KE TEMPLATE}
        'script'=>'{namamodule}/crudassets/script',//ini buat javascript apa aja yang di load di page {DIKIRIM KE TEMPLATE}
        'action'=>'{namamodule}/dinas/update_action',
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
		'username' => $this->input->post('username',TRUE),
		'password' => $this->input->post('password',TRUE),
		'nama' => $this->input->post('nama',TRUE),
		'email' => $this->input->post('email',TRUE),
		'kota' => $this->input->post('kota',TRUE),
		'foto' => $this->input->post('foto',TRUE),
		'status' => $this->input->post('status',TRUE),
		'level' => $this->input->post('level',TRUE),
		'id_superadmin' => $this->input->post('id_superadmin',TRUE),
	    );

            $this->Admin_dinas_model->insert($data);
            $this->session->set_flashdata('message', 'Create Record Success');
            redirect(site_url('{namamodule}/dinas'));
        }
    }



    public function update_action()
    {
        $this->_rules();

        if ($this->form_validation->run() == FALSE) {
            $this->edit($this->input->post('id', TRUE));
        } else {
            $data = array(
		'username' => $this->input->post('username',TRUE),
		'password' => $this->input->post('password',TRUE),
		'nama' => $this->input->post('nama',TRUE),
		'email' => $this->input->post('email',TRUE),
		'kota' => $this->input->post('kota',TRUE),
		'foto' => $this->input->post('foto',TRUE),
		'status' => $this->input->post('status',TRUE),
		'level' => $this->input->post('level',TRUE),
		'id_superadmin' => $this->input->post('id_superadmin',TRUE),
	    );

            $this->Admin_dinas_model->update($this->input->post('id', TRUE), $data);
            $this->session->set_flashdata('message', 'Update Record Success');
            redirect(site_url('{namamodule}/dinas'));
        }
    }

    public function delete($id)
    {
        $row = $this->Admin_dinas_model->get_by_id($id);

        if ($row) {
            $this->Admin_dinas_model->delete($id);
            $this->session->set_flashdata('message', 'Delete Record Success');
            redirect(site_url('{namamodule}/dinas'));
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('{namamodule}/dinas'));
        }
    }

    public function _rules()
    {
	$this->form_validation->set_rules('username', 'username', 'trim|required');
	$this->form_validation->set_rules('password', 'password', 'trim|required');
	$this->form_validation->set_rules('nama', 'nama', 'trim|required');
	$this->form_validation->set_rules('email', 'email', 'trim|required');
	$this->form_validation->set_rules('kota', 'kota', 'trim|required');
	$this->form_validation->set_rules('foto', 'foto', 'trim|required');
	$this->form_validation->set_rules('status', 'status', 'trim|required');
	$this->form_validation->set_rules('level', 'level', 'trim|required');
	$this->form_validation->set_rules('id_superadmin', 'id superadmin', 'trim|required');

	$this->form_validation->set_rules('id', 'id', 'trim');
	$this->form_validation->set_error_delimiters('<span class="text-danger">', '</span>');
    }

}