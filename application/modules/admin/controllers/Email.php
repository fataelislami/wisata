<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Email extends MY_Controller{

  public function __construct()
  {
    parent::__construct();
    //Codeigniter : Write Less Do More
  }

  function index()
  {

  }
  public function send($subject,$isi,$emailtujuan){

  $config['protocol'] = 'smtp';
  $config['smtp_host'] = 'ssl://smtp.gmail.com';
  $config['smtp_port'] = '465';
  $config['smtp_user'] = 'shopagansta@gmail.com';
  $config['smtp_pass'] = 'faztars123'; //ini pake akun pass google email
  $config['mailtype'] = 'html';
  $config['charset'] = 'iso-8859-1';
  $config['wordwrap'] = 'TRUE';
  $config['newline'] = "\r\n";

  $this->load->library('email', $config);
  $this->email->initialize($config);

  $this->email->from('shopagansta@gmail.com');
  $this->email->to($emailtujuan);
  $this->email->subject($subject);
  $this->email->message($isi);
  $this->email->set_mailtype('html');
  $this->email->send();
}

}
