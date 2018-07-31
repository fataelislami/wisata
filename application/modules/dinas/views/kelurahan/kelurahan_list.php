<div class="row">
    <div class="col-12">
        <div class="card">
            <div class="card-body">
              <div class="row">
                  <div class="col-md-6">
                      <h4 class="card-title">Data Kelurahan</h4>
                      <h6 class="card-subtitle">Export data to Copy, CSV, Excel, PDF & Print</h6>
                  </div>
                  <div class="col-md-6 text-right">
                      <?php echo anchor(site_url($module.'/kelurahan/create'), '+ Tambah Data', 'class="btn btn-primary"'); ?>
      	    </div>
              </div>


                <div class="table-responsive m-t-40">
                    <table id="example23" class="display nowrap table table-hover table-striped table-bordered" cellspacing="0" width="100%">
                        <thead>
                            <tr>
                                  <th>id</th>
                                  <th>kelurahan</th>
                                  <th>kecamatan</th>
                                  <th>aksi</th>
                            </tr>
                        </thead>
                        <tbody>
                          <?php foreach ($datakelurahan as $d): ?>
                            <tr>
                              <td><?php echo $d->id_kelurahan ?></td>
                              <td><?php echo $d->nama_kelurahan ?></td>
                              <td><?php echo $d->nama_kecamatan ?></td>
                                <td>
                                <a href="<?php echo base_url().$module?>/kelurahan/edit/<?php echo $d->id_kelurahan ?>">
                                        <button class="btn btn-success waves-effect waves-light m-r-10">Edit</button>
                                    </a>
                                    <a href="<?php echo base_url().$module?>/kelurahan/delete/<?php echo $d->id_kelurahan ?>">
                                      <button class="btn btn-danger waves-effect waves-light m-r-10" >Delete</button>
                                    </a>
                                </td>
                            </tr>
                          <?php endforeach; ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
