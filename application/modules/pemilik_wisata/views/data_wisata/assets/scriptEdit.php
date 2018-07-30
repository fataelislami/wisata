<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false&key=AIzaSyB3sQdBeiGlXTeWmWAOffst7X8syIzs2vY&libraries=places"></script>
<script type="text/javascript">

 var triangleCoords = [<?php echo $polygon ?>];




function init(){
 //var info_window = new google.maps.InfoWindow();

 // membuat peta
 var map = new google.maps.Map(document.getElementById('maps'),{
  'center': {lat : -6.91757808164908, lng : 107.60850421142572},
  'zoom': 12,
   scaleControl : true,
  'mapTypeId': google.maps.MapTypeId.ROADMAP
  });
  /*info_window = new google.maps.InfoWindow({
  'content': 'loading...'
 });*/

 var polygon = new google.maps.Polygon({
      path:triangleCoords,
      strokeColor: '#FF0000',
      strokeOpacity: 0.8,
      strokeWeight: 3,
      fillColor: '#FF0000',
      fillOpacity: 0.35
      });

 polygon.setMap(map);

 polygon.addListener('click', showArrays);

}



  function updateMarkerPosition(latLng) {
       document.getElementById('lat').value = [latLng.lat()];//posisi marker mengikuti nilai latitude yang di klik/pilih
       document.getElementById('lng').value = [latLng.lng()];////posisi marker mengikuti nilai longitude yang di klik/pilih
  }

  var gmarkers = [];

  function showArrays(event) {

    //jquery
      $("#lat").val(event.latLng.lat());//mengambil nilai latitude dan ditampilkan nantinya di form input
      $("#lng").val(event.latLng.lng());//mengambil nilai longitude dan ditampilkan nantinya di form input



      //inisialisasi marker
      var marker1 = new google.maps.Marker({
        position : new google.maps.LatLng(event.latLng.lat(), event.latLng.lng()),
        title : 'lokasi',
        map : map,
        draggable : false
      });
      removeMarkers();
      gmarkers.push(marker1);

  }

  //fungsi hapus marker. marker akan dihapus ketika klik pada posisi yang lain.
  function removeMarkers(){
        for(i=0; i<gmarkers.length; i++){
            gmarkers[i].setMap(null);
        }
  }

function cari_alamat(){

 google.maps.Polygon.prototype.Contains = function (point) {
    var crossings = 0,
        path = this.getPath();

    // for each edge
      for (var i = 0; i < path.getLength(); i++) {
        var a = path.getAt(i),
            j = i + 1;
        if (j >= path.getLength()) {
            j = 0;
        }
        var b = path.getAt(j);
        if (rayCrossesSegment(point, a, b)) {
            crossings++;
        }
      }

    // odd number of crossings?
    return (crossings % 2 == 1);

    function rayCrossesSegment(point, a, b) {
        var px = point.lng(),
            py = point.lat(),
            ax = a.lng(),
            ay = a.lat(),
            bx = b.lng(),
            by = b.lat();
        if (ay > by) {
            ax = b.lng();
            ay = b.lat();
            bx = a.lng();
            by = a.lat();
        }
        // alter longitude to cater for 180 degree crossings
        if (px < 0) {
            px += 360;
        }
        if (ax < 0) {
            ax += 360;
        }
        if (bx < 0) {
            bx += 360;
        }

        if (py == ay || py == by) py += 0.00000001;
        if ((py > by || py < ay) || (px > Math.max(ax, bx))) return false;
        if (px < Math.min(ax, bx)) return true;

        var red = (ax != bx) ? ((by - ay) / (bx - ax)) : Infinity;
        var blue = (ax != px) ? ((py - ay) / (px - ax)) : Infinity;
        return (blue >= red);

    }

 };

 // mengambil isi dari textarea dengan id alamat
 var alamat = document.getElementById('alamat').value;

 // membuat geocoder
 var geocoder = new google.maps.Geocoder();
 geocoder.geocode(
  {'address': alamat},
  function(results, status) {
   if (status == google.maps.GeocoderStatus.OK) {
    var info_window = new google.maps.InfoWindow();

    // mendapatkan lokasi koordinat
    var geo = results[0].geometry.location;

    // set koordinat
    var pos = new google.maps.LatLng(geo.lat(),geo.lng());

    //cek lat long di dalam polygon
    var point = new google.maps.LatLng(geo.lat(),geo.lng());

    var polygon = new google.maps.Polygon({
            path:triangleCoords,
            strokeColor: '#FF0000',
            strokeOpacity: 0.8,
            strokeWeight: 3,
            fillColor: '#FF0000',
            fillOpacity: 0.35
            });

         if (polygon.Contains(point)) {
              // point is inside polygon

            // menampilkan latitude dan longitude pada id lat dan lng
            var lat = document.getElementById('lat').value = geo.lat();
            var lng = document.getElementById('lng').value = geo.lng();
            document.getElementById('alamatFix').value = document.getElementById('alamat').value;

             // membuat peta
            var map = new google.maps.Map(document.getElementById('maps'),{
              'center': pos,
              'zoom': 17,
              'mapTypeId': google.maps.MapTypeId.ROADMAP
             });
            polygon.setMap(map);

            // menambahkan marker pada peta
            var marker = new google.maps.Marker({
             position: pos,
             title: alamat,
             animation:google.maps.Animation.BOUNCE
            });
            marker.setMap(map);

            // menambahkan event click ketika marker di klik
            google.maps.event.addListener(marker, 'click', function () {
             info_window.setContent('<b>'+ this.title +'</b>');
             info_window.open(map, this);
            });
          } else {
            alert('Mohon Maaf Lokasi yang Anda Masukan diluar Kota Bandung');
              var lat = document.getElementById('lat').value = "";
            var lng = document.getElementById('lng').value = "";
          }

   } else {
     alert('Lokasi Tidak Ditemukan');
   }
  }
 );
}
google.maps.event.addDomListener(window, 'load', init);

</script>
<!-- JAVASCRP MAPS -->
<script src="<?php echo base_url()?>assets/plugins/summernote/dist/summernote.min.js"></script>

<!-- Sweet-Alert  -->
<script src="<?php echo base_url()?>assets/plugins/sweetalert/sweetalert.min.js"></script>
<script src="<?php echo base_url()?>assets/plugins/sweetalert/jquery.sweet-alert.custom.js"></script>
<script>
jQuery(document).ready(function() {

    $('.summernote').summernote({
        height: 350, // set editor height
        minHeight: null, // set minimum height of editor
        maxHeight: null, // set maximum height of editor
        focus: false // set focus to editable area after initializing summernote
    });

    $('.inline-editor').summernote({
        airMode: true
    });

});

window.edit = function() {
        $(".click2edit").summernote()
    },
    window.save = function() {
        $(".click2edit").summernote('destroy');
    }
</script>

<!-- This is data table -->
<script src="<?php echo base_url()?>assets/plugins/datatables/jquery.dataTables.min.js"></script>
<!-- start - This is for export functionality only -->
<script src="https://cdn.datatables.net/buttons/1.2.2/js/dataTables.buttons.min.js"></script>
<script src="https://cdn.datatables.net/buttons/1.2.2/js/buttons.flash.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/2.5.0/jszip.min.js"></script>
<script src="https://cdn.rawgit.com/bpampuch/pdfmake/0.1.18/build/pdfmake.min.js"></script>
<script src="https://cdn.rawgit.com/bpampuch/pdfmake/0.1.18/build/vfs_fonts.js"></script>
<script src="https://cdn.datatables.net/buttons/1.2.2/js/buttons.html5.min.js"></script>
<script src="https://cdn.datatables.net/buttons/1.2.2/js/buttons.print.min.js"></script>
<!-- end - This is for export functionality only -->
<script>
$(document).ready(function() {
    $('#myTable').DataTable();
    $(document).ready(function() {
        var table = $('#example').DataTable({
            "columnDefs": [{
                "visible": false,
                "targets": 2
            }],
            "order": [
                [2, 'asc']
            ],
            "displayLength": 25,
            "drawCallback": function(settings) {
                var api = this.api();
                var rows = api.rows({
                    page: 'current'
                }).nodes();
                var last = null;
                api.column(2, {
                    page: 'current'
                }).data().each(function(group, i) {
                    if (last !== group) {
                        $(rows).eq(i).before('<tr class="group"><td colspan="5">' + group + '</td></tr>');
                        last = group;
                    }
                });
            }
        });
        // Order by the grouping
        $('#example tbody').on('click', 'tr.group', function() {
            var currentOrder = table.order()[0];
            if (currentOrder[0] === 2 && currentOrder[1] === 'asc') {
                table.order([2, 'desc']).draw();
            } else {
                table.order([2, 'asc']).draw();
            }
        });
    });
});
$('#example23').DataTable({
    dom: 'Bfrtip',
    buttons: [
        'copy', 'csv', 'excel', 'pdf', 'print'
    ]
});
</script>

<!-- SELECT SELECT AN UHUY -->
<script type="text/javascript">
  $(document).ready(function(){
    loadKota();
    loadkecamatan($("#getIdKota").val());
    loadkelurahan($("#getIdKecamatan").val());


    $("#kota").change(function(){
      var id_kota=$(this).val();
      $("#kecamatan").html('<option value="null">Pilih Kecamatan</option>');
      $("#kelurahan").html('<option value="null">Pilih Kelurahan</option>');
      loadkecamatan(id_kota);
    });
    $("#kecamatan").change(function(){
      var id_kecamatan=$(this).val();
      $("#kelurahan").html('<option value="null">Pilih Kelurahan</option>');
      loadkelurahan(id_kecamatan);
    });

    //fungsi load kelurahan
    function loadkelurahan(id_kecamatan){
      var settings = {
    "url": "<?php echo base_url()?>json/get_kelurahan_by_kecamatan/"+id_kecamatan,
    "method": "GET",
  }

  $.ajax(settings).done(function (response) {
    items=JSON.parse(response);
    var akhir=items.length;
    var selectedKelurahan=$("#getIdKelurahan").val();
    for(var i=0;i<akhir;i++){
      if(items[i].id==selectedKelurahan){
        $("#kelurahan").append('<option value="'+items[i].id+'" selected>'+items[i].nama+'</option>');
      }
      $("#kelurahan").append('<option value="'+items[i].id+'">'+items[i].nama+'</option>');
      console.log(items[i].nama);
    }
  });
    }
    //fungsi load kecamatan
    function loadkecamatan(id_kota){
      var settings = {
    "url": "<?php echo base_url()?>json/get_kecamatan_by_kota/"+id_kota,
    "method": "GET",
  }

  $.ajax(settings).done(function (response) {
    var selected=$("#getIdKecamatan").val();
    items=JSON.parse(response);
    var akhir=items.length;
    for(var i=0;i<akhir;i++){
      if(selected==items[i].id){
        $("#kecamatan").append('<option value="'+items[i].id+'" selected>'+items[i].nama+'</option>');
      }else{
        $("#kecamatan").append('<option value="'+items[i].id+'">'+items[i].nama+'</option>');
      }
      console.log(items[i].nama);
    }
  });
    }
    function loadKota(){
      var settings = {
    "url": "<?php echo base_url()?>json/get_kota",
    "method": "GET",
  }

  $.ajax(settings).done(function (response) {
    var selected=$("#getIdKota").val();
    items=JSON.parse(response);
    var akhir=items.length;
    $("#kota").append('<option value="null">Pilih Kota</option>');
    for(var i=0;i<akhir;i++){
      if(selected==items[i].id){
        $("#kota").append('<option value="'+items[i].id+'" selected>'+items[i].nama+'</option>');
      }else{
        $("#kota").append('<option value="'+items[i].id+'">'+items[i].nama+'</option>');
      }
      console.log(items[i].nama);
    }
  });
    }

  });
</script>
