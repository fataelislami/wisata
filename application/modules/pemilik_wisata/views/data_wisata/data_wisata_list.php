<div class="row">
    <div class="col-12">
        <div class="card">
            <div class="card-body">
              <div class="row">
                  <div class="col-md-6">
                      <h4 class="card-title">Data Data_wisata</h4>
                      <h6 class="card-subtitle">Export data to Copy, CSV, Excel, PDF & Print</h6>
                  </div>
                  <div class="col-md-6 text-right">
                      <?php echo anchor(site_url($module.'/data_wisata/create'), '+ Tambah Data', 'class="btn btn-primary"'); ?>
      	    </div>
              </div>


                <div class="table-responsive m-t-40">
                    <table id="example23" class="display nowrap table table-hover table-striped table-bordered" cellspacing="0" width="100%">
                        <thead>
                            <tr>
                                <th>id</th>
                                <th>nama</th>
                                <th>alamat</th>
                                <th>no telp</th>
                                <th>aksi</th>
                            </tr>
                        </thead>
                        <tbody>
                          <?php foreach ($datadata_wisata as $d): ?>
                            <tr>
                                <td><?php echo $d->id ?></td>
                                <td><?php echo $d->nama ?></td>
                                <td><?php echo $d->alamat ?></td>
                                <td><?php echo $d->no_telp ?></td>
                                <td>
                                <a href="<?php echo base_url().$module?>/data_wisata/edit/<?php echo $d->id ?>">
                                        <button class="btn btn-success waves-effect waves-light m-r-10">Edit</button>
                                    </a>
                                    <a href="<?php echo base_url().$module?>/data_wisata/safe_delete/<?php echo $d->id ?>">
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
