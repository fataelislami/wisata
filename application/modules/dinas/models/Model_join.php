<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Model_join extends CI_Model{

  public function __construct()
  {
    parent::__construct();
    //Codeigniter : Write Less Do More
  }

  function kelurahan_dan_kecamatan($id_kota){
    $sql="SELECT `kota`.`id` as `id_kota`,`kelurahan`.`id` as `id_kelurahan`,`kelurahan`.`nama` as `nama_kelurahan`,`kecamatan`.`id` as `id_kecamatan`,`kecamatan`.`nama` as `nama_kecamatan`
    FROM `kota` INNER JOIN `kecamatan` ON `kota`.`id`= `kecamatan`.`id_kota`
    INNER JOIN `kelurahan` ON `kecamatan`.`id`=`kelurahan`.`id_kecamatan` WHERE `kota`.`id`=$id_kota";
    return $this->db->query($sql)->result();
  }
  function kelurahan_dan_kecamatan_distinct($id_kota){
    $sql="SELECT DISTINCT `kecamatan`.`id` as `id_kecamatan`,`kecamatan`.`nama` as `nama_kecamatan`
    FROM `kota` INNER JOIN `kecamatan` ON `kota`.`id`= `kecamatan`.`id_kota`
    INNER JOIN `kelurahan` ON `kecamatan`.`id`=`kelurahan`.`id_kecamatan` WHERE `kota`.`id`=$id_kota";
    return $this->db->query($sql)->result();
  }

}
