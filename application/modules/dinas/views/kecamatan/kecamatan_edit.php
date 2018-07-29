<div class="row">
  <div class="col-12">
    <div class="card">
        <div class="card-body">
            <h4 class="card-title">Tambah Kecamatan</h4>
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
            <label>Kota</label>
            <select class="form-control" name="id_kota">
              <option value="<?php echo $data_kota->id ?>"><?php echo $data_kota->nama ?></option>
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
