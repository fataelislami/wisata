<div class="row">
  <div class="col-12">
    <div class="card">
        <div class="card-body">
            <h4 class="card-title">Tambah Data_wisata</h4>
            <form class="form-material m-t-40" method="post" action="<?php echo base_url().$action ?>" enctype="multipart/form-data">
	  <div class="form-group">
                    <label>id</label>
                    <input type="text" id="id_wisata" name="id" class="form-control" placeholder="" value="<?php echo $dataedit->id?>" readonly>
            </div>
	  <div class="form-group">
            <label>nama</label>
            <input type="text" name="nama" class="form-control" value="<?php echo $dataedit->nama?>">
    </div>
	  <div class="form-group">
            <label>lat</label>
            <input type="text" name="lat" class="form-control" value="<?php echo $dataedit->lat?>">
    </div>
	  <div class="form-group">
            <label>lang</label>
            <input type="text" name="lang" class="form-control" value="<?php echo $dataedit->lang?>">
    </div>
	  <div class="form-group">
            <label>alamat</label>
            <input type="text" name="alamat" class="form-control" value="<?php echo $dataedit->alamat?>">
    </div>
	  <div class="form-group">
            <label>keterangan</label>
            <input type="text" name="keterangan" class="form-control" value="<?php echo $dataedit->keterangan?>">
    </div>
	  <div class="form-group">
            <label>harga_tiket</label>
            <input type="text" name="harga_tiket" class="form-control" value="<?php echo $dataedit->harga_tiket?>">
    </div>
	  <div class="form-group">
            <label>peta_marker</label>
            <input type="text" name="peta_marker" class="form-control" value="<?php echo $dataedit->peta_marker?>">
    </div>
    <div class="form-group">
            <label>Kota</label>
            <select class="form-control" id="kota" name="id_kota">
            </select>
    </div>
    <div class="form-group">
            <label>Kecamatan</label>
            <select class="form-control" id="kecamatan" name="id_kecamatan">
              <option value="null">Pilih Kecamatan</option>
            </select>
    </div>
    <div class="form-group">
            <label>Kelurahan</label>
            <select class="form-control" id="kelurahan" name="id_kelurahan">
              <option value="null">Pilih Kelurahan</option>
            </select>
    </div>
	  <div class="form-group">
            <label>no_telp</label>
            <input type="text" name="no_telp" class="form-control" value="<?php echo $dataedit->no_telp?>">
    </div>
	  <div class="form-group">
            <label>htm_dewasa</label>
            <input type="text" name="htm_dewasa" class="form-control" value="<?php echo $dataedit->htm_dewasa?>">
    </div>
	  <div class="form-group">
            <label>htm_anak</label>
            <input type="text" name="htm_anak" class="form-control" value="<?php echo $dataedit->htm_anak?>">
    </div>
    <div class="form-group">
            <label>Status</label>
            <select class="form-control" name="status">
              <option value="aktif" <?php if($dataedit->status=='aktif'){echo "selected";} ?>>aktif</option>
              <option value="pending" <?php  if($dataedit->status=='pending'){echo "selected";} ?>>pending</option>
            </select>
    </div>
    <div id="getGambar">

    </div>
    <div class="form-group">
            <label>Gambar</label>
            <input type="file" name="gambar[]" multiple>
    </div>


<input type="hidden" id="getIdKota" value="<?php echo $dataedit->id_kota?>">
<input type="hidden" id="getIdKecamatan" value="<?php echo $dataedit->id_kecamatan?>">
<input type="hidden" id="getIdKelurahan" value="<?php echo $dataedit->id_kelurahan?>">


                <div class="form-group">
                  <button type="submit" class="btn btn-success waves-effect waves-light m-r-10">Submit</button>
                </div>
            </form>
        </div>
    </div>
  </div>
</div>
