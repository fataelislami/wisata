<div class="row">
  <div class="col-12">
    <div class="card">
        <div class="card-body">
            <h4 class="card-title">Tambah Data_wisata</h4>
            <form class="form-material m-t-40" method="post" action="<?php echo base_url().$action ?>">
	  <div class="form-group">
                    <label>id</label>
                    <input type="text" name="id" class="form-control" placeholder="" value="<?php echo $dataedit->id?>" readonly>
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
            <label>id_kota</label>
            <input type="text" name="id_kota" class="form-control" value="<?php echo $dataedit->id_kota?>">
    </div>
	  <div class="form-group">
            <label>id_kecamatan</label>
            <input type="text" name="id_kecamatan" class="form-control" value="<?php echo $dataedit->id_kecamatan?>">
    </div>
	  <div class="form-group">
            <label>id_kelurahan</label>
            <input type="text" name="id_kelurahan" class="form-control" value="<?php echo $dataedit->id_kelurahan?>">
    </div>
	  <div class="form-group">
            <label>id_user</label>
            <input type="text" name="id_user" class="form-control" value="<?php echo $dataedit->id_user?>">
    </div>
	  <div class="form-group">
            <label>safe_delete</label>
            <input type="text" name="safe_delete" class="form-control" value="<?php echo $dataedit->safe_delete?>">
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
                  <button type="submit" class="btn btn-success waves-effect waves-light m-r-10">Submit</button>
                </div>
            </form>
        </div>
    </div>
  </div>
</div>
