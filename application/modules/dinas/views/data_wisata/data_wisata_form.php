<div class="row">
    <div class="col-12">
        <div class="card">
            <div class="card-body">
              <div class="row">
                  <div class="col-md-6">
                      <h4 class="card-title">Selamat Datang di Admin Area</h4>
                      <h6 class="card-subtitle">SIDOMA BOT by RPL-11</h6>
                  </div>
                  <div class="col-md-6 text-right">
                  </div>
              </div>
              <div id="maps" style="width:940px; height:300px;">
              </div>
              <div class="row">
                <div class="col-md-12">
                  <div class="form-group">
                          <label>alamat</label>
                          <input type="text" id="alamat" class="form-control" placeholder="">
                          <br>
                          <br>
                          <center><button href="#" class="btn btn-primary" onclick="cari_alamat()" >CARI ALAMAT</button></center>
                  </div>
                </div>

              </div>
            </div>
        </div>
    </div>
</div>

<div class="row">
  <div class="col-12">
    <div class="card">
        <div class="card-body">
            <h4 class="card-title">Tambah Data_wisata</h4>
            <form class="form-material m-t-40" method="post" action="<?php echo base_url().$action ?>" enctype="multipart/form-data">
	  <div class="form-group">
            <label>nama</label>
            <input type="text" name="nama" class="form-control" placeholder="">
    </div>


        <div class="form-group">
                <label>alamat</label>
                <input type="text" id="alamatFix" name="alamat" class="form-control" placeholder="">
        </div>

    <div class="row">
      <div class="col-6">
        <div class="form-group">
                <label>latitude</label>
                <input type="text" id="lat" name="lat" class="form-control" placeholder="">
        </div>
      </div>
      <div class="col-6">
        <div class="form-group">
                <label>longitude</label>
                <input type="text" id="lng" name="lang" class="form-control" placeholder="">
        </div>
      </div>
    </div>
	  <div class="form-group">
            <label>keterangan</label>
            <input type="text" name="keterangan" class="form-control" placeholder="">
    </div>
	  <div class="form-group">
            <label>harga_tiket</label>
            <input type="text" name="harga_tiket" class="form-control" placeholder="">
    </div>
	  <div class="form-group">
            <label>peta_marker</label>
            <input type="text" name="peta_marker" class="form-control" placeholder="">
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
            <input type="text" name="no_telp" class="form-control" placeholder="">
    </div>
	  <div class="form-group">
            <label>htm_dewasa</label>
            <input type="text" name="htm_dewasa" class="form-control" placeholder="">
    </div>
	  <div class="form-group">
            <label>htm_anak</label>
            <input type="text" name="htm_anak" class="form-control" placeholder="">
    </div>
    <div class="form-group">
            <label>Status</label>
            <select class="form-control" name="status">
              <option value="aktif">aktif</option>
              <option value="pending">pending</option>
            </select>
    </div>
    <div class="form-group">
            <label>Gambar</label>
            <input type="file" name="gambar[]" multiple>
    </div>
	    <input type="hidden" name="id" />

                <div class="form-group">
                  <button type="submit" class="btn btn-success waves-effect waves-light m-r-10">Submit</button>
                </div>
            </form>
        </div>
    </div>
  </div>
</div>
