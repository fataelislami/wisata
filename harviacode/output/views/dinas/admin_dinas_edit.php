<div class="row">
  <div class="col-12">
    <div class="card">
        <div class="card-body">
            <h4 class="card-title">Tambah Admin_dinas</h4>
            <form class="form-material m-t-40" method="post" action="<?php echo base_url().$action ?>">
	  <div class="form-group">
                    <label>id</label>
                    <input type="text" name="id" class="form-control" placeholder="" value="<?php echo $dataedit->id?>" readonly>
            </div>
	  <div class="form-group">
            <label>username</label>
            <input type="text" name="username" class="form-control" value="<?php echo $dataedit->username?>">
    </div>
	  <div class="form-group">
            <label>password</label>
            <input type="text" name="password" class="form-control" value="<?php echo $dataedit->password?>">
    </div>
	  <div class="form-group">
            <label>nama</label>
            <input type="text" name="nama" class="form-control" value="<?php echo $dataedit->nama?>">
    </div>
	  <div class="form-group">
            <label>email</label>
            <input type="text" name="email" class="form-control" value="<?php echo $dataedit->email?>">
    </div>
	  <div class="form-group">
            <label>kota</label>
            <input type="text" name="kota" class="form-control" value="<?php echo $dataedit->kota?>">
    </div>
	  <div class="form-group">
            <label>foto</label>
            <input type="text" name="foto" class="form-control" value="<?php echo $dataedit->foto?>">
    </div>
	  <div class="form-group">
            <label>status</label>
            <input type="text" name="status" class="form-control" value="<?php echo $dataedit->status?>">
    </div>
	  <div class="form-group">
            <label>level</label>
            <input type="text" name="level" class="form-control" value="<?php echo $dataedit->level?>">
    </div>
	  <div class="form-group">
            <label>id_superadmin</label>
            <input type="text" name="id_superadmin" class="form-control" value="<?php echo $dataedit->id_superadmin?>">
    </div>
	
                <div class="form-group">
                  <button type="submit" class="btn btn-success waves-effect waves-light m-r-10">Submit</button>
                </div>
            </form>
        </div>
    </div>
  </div>
</div>
