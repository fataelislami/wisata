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
        'contain_view' => 'admin/kelurahan/kelurahan_list',
        'sidebar'=>'admin/sidebar',
        'css'=>'admin/crudassets/css',
        'script'=>'admin/crudassets/script',
        'datakelurahan'=>$datakelurahan,
        'datafield'=>$datafield,
        'module'=>'admin'
       );
      $this->template->load($data);
    }


    public function create(){
      $data = array(
        'contain_view' => 'admin/kelurahan/kelurahan_form',
        'sidebar'=>'admin/sidebar',//Ini buat menu yang ditampilkan di module admin {DIKIRIM KE TEMPLATE}
        'css'=>'admin/crudassets/css',//Ini buat kirim css dari page nya  {DIKIRIM KE TEMPLATE}
        'script'=>'admin/crudassets/script',//ini buat javascript apa aja yang di load di page {DIKIRIM KE TEMPLATE}
        'action'=>'admin/kelurahan/create_action'
       );
      $this->template->load($data);
    }

    public function edit($id){
      $dataedit=$this->MKelurahan->get_by_id($id);
      $data = array(
        'contain_view' => 'admin/kelurahan/kelurahan_edit',
        'sidebar'=>'admin/sidebar',//Ini buat menu yang ditampilkan di module admin {DIKIRIM KE TEMPLATE}
        'css'=>'admin/crudassets/css',//Ini buat kirim css dari page nya  {DIKIRIM KE TEMPLATE}
        'script'=>'admin/crudassets/script',//ini buat javascript apa aja yang di load di page {DIKIRIM KE TEMPLATE}
        'action'=>'admin/kelurahan/update_action',
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
            redirect(site_url('admin/kelurahan'));
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
            redirect(site_url('admin/kelurahan'));
        }
    }

    public function delete($id)
    {
        $row = $this->MKelurahan->get_by_id($id);

        if ($row) {
            $this->MKelurahan->delete($id);
            $this->session->set_flashdata('message', 'Delete Record Success');
            redirect(site_url('admin/kelurahan'));
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('admin/kelurahan'));
        }
    }

    public function export(){
      // Load plugin PHPExcel nya
      include APPPATH.'third_party/PHPExcel/PHPExcel.php';

      // Panggil class PHPExcel nya
      $excel = new PHPExcel();

      // Settingan awal fil excel
      $excel->getProperties()->setCreator('Wisata Cuy!')
                   ->setLastModifiedBy('Wisata Cuy!')
                   ->setTitle("Data Kelurahan")
                   ->setSubject("IF 11")
                   ->setDescription("Tubes Atol")
                   ->setKeywords("Data Kelurahan");

      // Buat sebuah variabel untuk menampung pengaturan style dari header tabel
      $style_col = array(
        'fill' => array(
                'type' => PHPExcel_Style_Fill::FILL_SOLID,
                'color' => array('rgb'=>'c8db36'),
        ),
        'font' => array('bold' => true), // Set font nya jadi bold
        'alignment' => array(
          'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER, // Set text jadi ditengah secara horizontal (center)
          'vertical' => PHPExcel_Style_Alignment::VERTICAL_CENTER // Set text jadi di tengah secara vertical (middle)
        ),
        'borders' => array(
          'top' => array('style'  => PHPExcel_Style_Border::BORDER_THIN), // Set border top dengan garis tipis
          'right' => array('style'  => PHPExcel_Style_Border::BORDER_THIN),  // Set border right dengan garis tipis
          'bottom' => array('style'  => PHPExcel_Style_Border::BORDER_THIN), // Set border bottom dengan garis tipis
          'left' => array('style'  => PHPExcel_Style_Border::BORDER_THIN) // Set border left dengan garis tipis
        )
      );

      // Buat sebuah variabel untuk menampung pengaturan style dari isi tabel
      $style_row = array(

        'alignment' => array(
          'vertical' => PHPExcel_Style_Alignment::VERTICAL_CENTER // Set text jadi di tengah secara vertical (middle)
        ),
        'borders' => array(
          'top' => array('style'  => PHPExcel_Style_Border::BORDER_THIN), // Set border top dengan garis tipis
          'right' => array('style'  => PHPExcel_Style_Border::BORDER_THIN),  // Set border right dengan garis tipis
          'bottom' => array('style'  => PHPExcel_Style_Border::BORDER_THIN), // Set border bottom dengan garis tipis
          'left' => array('style'  => PHPExcel_Style_Border::BORDER_THIN) // Set border left dengan garis tipis
        )
      );

      $excel->setActiveSheetIndex(0)->setCellValue('A1', "DATA KELURAHAN"); // Set kolom A1 dengan tulisan "DATA SISWA"
      $excel->getActiveSheet()->mergeCells('A1:C1'); // Set Merge Cell pada kolom A1 sampai E1
      $excel->getActiveSheet()->getStyle('A1')->getFont()->setBold(TRUE); // Set bold kolom A1
      $excel->getActiveSheet()->getStyle('A1')->getFont()->setSize(15); // Set font size 15 untuk kolom A1
      $excel->getActiveSheet()->getStyle('A1')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER); // Set text center untuk kolom A1

      $excel->setActiveSheetIndex(0)->setCellValue('A3', "Tanggal Cetak : ".date("d F Y"));

      // Buat header tabel nya pada baris ke 3
      $excel->setActiveSheetIndex(0)->setCellValue('A4', "No"); // Set kolom A3 dengan tulisan "ID"
      $excel->setActiveSheetIndex(0)->setCellValue('B4', "ID"); // Set kolom B3 dengan tulisan "NAMA"
      $excel->setActiveSheetIndex(0)->setCellValue('C4', "NAMA"); // Set kolom B3 dengan tulisan "NAMA"

      // Apply style header yang telah kita buat tadi ke masing-masing kolom header
      $excel->getActiveSheet()->getStyle('A4')->applyFromArray($style_col);
      $excel->getActiveSheet()->getStyle('B4')->applyFromArray($style_col);
      $excel->getActiveSheet()->getStyle('C4')->applyFromArray($style_col);

      // Panggil function view yang ada di SiswaModel untuk menampilkan semua data siswanya
      $Kelurahan = $this->MKelurahan->get_all();

      $no = 1; // Untuk penomoran tabel, di awal set dengan 1
      $numrow = 5; // Set baris pertama untuk isi tabel adalah baris ke 4
      foreach($Kelurahan as $data){ // Lakukan looping pada variabel siswa
        $excel->setActiveSheetIndex(0)->setCellValue('A'.$numrow, $no);
        $excel->setActiveSheetIndex(0)->setCellValue('B'.$numrow, $data->id );
        $excel->setActiveSheetIndex(0)->setCellValue('C'.$numrow, $data->nama);

        // Apply style row yang telah kita buat tadi ke masing-masing baris (isi tabel)
        $excel->getActiveSheet()->getStyle('A'.$numrow)->applyFromArray($style_row);
        $excel->getActiveSheet()->getStyle('B'.$numrow)->applyFromArray($style_row);
        $excel->getActiveSheet()->getStyle('C'.$numrow)->applyFromArray($style_row);
        $no++; // Tambah 1 setiap kali looping
        $numrow++; // Tambah 1 setiap kali looping
      }

      // Set width kolom
      $excel->getActiveSheet()->getColumnDimension('A')->setWidth(5); // Set width kolom A
      $excel->getActiveSheet()->getColumnDimension('B')->setWidth(15); // Set width kolom B
      $excel->getActiveSheet()->getColumnDimension('C')->setWidth(35); // Set width kolom B
      // Set height semua kolom menjadi auto (mengikuti height isi dari kolommnya, jadi otomatis)
      $excel->getActiveSheet()->getDefaultRowDimension()->setRowHeight(-1);

      // Set orientasi kertas jadi LANDSCAPE
      $excel->getActiveSheet()->getPageSetup()->setOrientation(PHPExcel_Worksheet_PageSetup::ORIENTATION_LANDSCAPE);

      // Set judul file excel nya
      $excel->getActiveSheet(0)->setTitle("Laporan Data Kelurahan");
      $excel->setActiveSheetIndex(0);

      // Proses file excel
      header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
      header('Content-Disposition: attachment; filename="Data Kelurahan.xlsx"'); // Set nama file excel nya
      header('Cache-Control: max-age=0');

      $write = PHPExcel_IOFactory::createWriter($excel, 'Excel2007');
      $write->save('php://output');
    }

    public function _rules()
    {
	$this->form_validation->set_rules('nama_kelurahan', 'nama kelurahan', 'trim|required');
	$this->form_validation->set_rules('id_kecamatan', 'id kecamatan', 'trim|required');

	$this->form_validation->set_rules('id', 'id', 'trim');
	$this->form_validation->set_error_delimiters('<span class="text-danger">', '</span>');
    }

}
