<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Front extends MY_Controller{

  public function __construct()
  {
    parent::__construct();
    //Codeigniter : Write Less Do More
  }

  function index()
  {
    $data = array('name' => 'ATOL WISATA CIHUY', );
    $this->load->view('welcome_message',$data);
  }

  function profile(){
    echo "ini homepage";
  }

}
