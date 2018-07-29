<div class="row">
  <div class="col-12">
    <div class="card">
        <div class="card-body">
            <h4 class="card-title">Tambah Pemilik_wisata</h4>
            <form class="form-material m-t-40" method="post" action="<?php echo base_url().$action ?>">
              <div class="form-group">
                      <label>email</label>
                      <input type="text" name="email" class="form-control" placeholder="">
              </div>
	  <div class="form-group">
            <label>password</label>
            <input type="text" name="password" class="form-control" placeholder="">
    </div>
	  <div class="form-group">
            <label>nama</label>
            <input type="text" name="nama" class="form-control" placeholder="">
    </div>
	  <div class="form-group">
            <label>alamat</label>
            <input type="text" name="alamat" class="form-control" placeholder="">
    </div>
	  <div class="form-group">
            <label>jenis_kelamin</label>
            <input type="text" name="jenis_kelamin" class="form-control" placeholder="">
    </div>
	  <div class="form-group">
            <label>tanggal_lahir</label>
            <input type="text" name="tanggal_lahir" class="form-control" placeholder="">
    </div>
    <div class="form-group">
            <label>No Ktp</label>
            <input type="text" name="no_ktp" class="form-control" placeholder="">
    </div>
	  <div class="form-group">
            <label>file_ktp</label>
            <input type="text" name="file_ktp" class="form-control" placeholder="">
    </div>
	  <div class="form-group">
      <label>status akun</label>
      <select class="form-control" name="status">
        <option value="aktif">Aktif</option>
        <option value="pending">Pending</option>
      </select>
    </div>
    <div class="form-group">
      <label>aktivasi akun</label>
      <select class="form-control" name="aktivasi">
        <option value="ya">Ya</option>
        <option value="tidak">Tidak</option>
      </select>
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
