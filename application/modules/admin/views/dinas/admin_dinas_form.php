<div class="row">
  <div class="col-12">
    <div class="card">
        <div class="card-body">
            <h4 class="card-title">Tambah Admin_dinas</h4>
            <form class="form-material m-t-40" method="post" action="<?php echo base_url().$action ?>">
	  <div class="form-group">
            <label>username</label>
            <input type="text" name="username" class="form-control" placeholder="">
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
            <label>email</label>
            <input type="text" name="email" class="form-control" placeholder="">
    </div>
    <div class="form-group">
            <label>Kota</label>
            <select class="form-control" id="kota" name="kota">
            </select>
    </div>
	  <div class="form-group">
            <label>foto</label>
            <input type="text" name="foto" class="form-control" placeholder="">
    </div>
	  <div class="form-group">
            <label>status</label>
            <select class="form-control" name="status">
              <option value="null">---</option>
              <option value="aktif">Aktif</option>
              <option value="pending">Pending</option>
            </select>
    </div>
	  <div class="form-group">
            <label>level</label>
            <input type="text" name="level" value="dinas" class="form-control" readonly>
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
