$(document).ready( function () {
    $('#publications').DataTable( {
      "order": [[ 4, 'desc' ]],
      columnDefs: [ {
        targets: 4,
        render: $.fn.dataTable.render.moment( 'DD MMM YYYY' )
      } ]
    } );
} );
