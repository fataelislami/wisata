<div class="row">
  <div class="col-12">
    <div class="card">
        <div class="card-body">
            <h4 class="card-title">Tambah User_dinas</h4>
            <form class="form-material m-t-40" method="post" action="<?php echo base_url().$action ?>">
	  <div class="form-group">
                    <label></label>
                    <input type="text" name="" class="form-control" placeholder="" value="<?php echo $dataedit->?>" readonly>
            </div>
	  <div class="form-group">
            <label>id_user</label>
            <input type="text" name="id_user" class="form-control" value="<?php echo $dataedit->id_user?>">
    </div>
	  <div class="form-group">
            <label>nama</label>
            <input type="text" name="nama" class="form-control" value="<?php echo $dataedit->nama?>">
    </div>
	  <div class="form-group">
            <label>wilayah</label>
            <input type="text" name="wilayah" class="form-control" value="<?php echo $dataedit->wilayah?>">
    </div>
	
                <div class="form-group">
                  <button type="submit" class="btn btn-success waves-effect waves-light m-r-10">Submit</button>
                </div>
            </form>
        </div>
    </div>
  </div>
</div>
