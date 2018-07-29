<div class="row">
  <div class="col-12">
    <div class="card">
        <div class="card-body">
            <h4 class="card-title">Tambah Pemilik_wisata</h4>
            <form class="form-material m-t-40" method="post" action="<?php echo base_url().$action ?>">
	  <div class="form-group">
                    <label>id</label>
                    <input type="text" name="id" class="form-control" placeholder="" value="<?php echo $dataedit->id?>" readonly>
            </div>
            <div class="form-group">
                    <label>email</label>
                    <input type="text" name="email" class="form-control" value="<?php echo $dataedit->email?>">
            </div>
	  <div class="form-group">
            <label>password</label>
            <input type="text" name="password" class="form-control" placeholder="masukan password baru">
    </div>
	  <div class="form-group">
            <label>nama</label>
            <input type="text" name="nama" class="form-control" value="<?php echo $dataedit->nama?>">
    </div>
	  <div class="form-group">
            <label>alamat</label>
            <input type="text" name="alamat" class="form-control" value="<?php echo $dataedit->alamat?>">
    </div>
	  <div class="form-group">
            <label>jenis_kelamin</label>
            <input type="text" name="jenis_kelamin" class="form-control" value="<?php echo $dataedit->jenis_kelamin?>">
    </div>
	  <div class="form-group">
            <label>tanggal_lahir</label>
            <input type="text" name="tanggal_lahir" class="form-control" value="<?php echo $dataedit->tanggal_lahir?>">
    </div>
    <div class="form-group">
            <label>No_ktp</label>
            <input type="text" name="no_ktp" class="form-control" value="<?php echo $dataedit->no_ktp?>">
    </div>
	  <div class="form-group">
            <label>file_ktp</label>
            <input type="text" name="file_ktp" class="form-control" value="<?php echo $dataedit->file_ktp?>">
    </div>
	  <div class="form-group">
            <label>status akun</label>
            <select class="form-control" name="status">
              <option value="aktif" <?php echo ($dataedit->status =='aktif' ? 'selected':'') ?>>Aktif</option>
              <option value="pending" <?php echo ($dataedit->status =='pending' ? 'selected':'') ?>>Pending</option>
            </select>
    </div>
    <div class="form-group">
      <label>aktivasi akun</label>
      <select class="form-control" name="aktivasi">
        <option value="ya" <?php echo ($dataedit->id_admin_dinas !=null ? 'selected':'') ?>>Ya</option>
        <option value="tidak" <?php echo ($dataedit->id_admin_dinas ==null ? 'selected':'') ?>>Tidak</option>
      </select>
    </div>


                <div class="form-group">
                  <button type="submit" class="btn btn-success waves-effect waves-light m-r-10">Submit</button>
                </div>
            </form>
        </div>
    </div>
  </div>
</div>
