<div class="row">
  <div class="col-12">
    <div class="card">
        <div class="card-body">
            <h4 class="card-title">Tambah Kelurahan</h4>
            <form class="form-material m-t-40" method="post" action="<?php echo base_url().$action ?>">
	  <div class="form-group">
            <label>nama</label>
            <input type="text" name="nama" class="form-control" placeholder="">
    </div>
	  <div class="form-group">
            <label>id_kecamatan</label>
            <select class="form-control" name="id_kecamatan">
              <?php foreach ($datakecamatan as $d): ?>
                <option value="<?php echo $d->id_kecamatan ?>"><?php echo $d->nama_kecamatan; ?></option>
              <?php endforeach; ?>
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
