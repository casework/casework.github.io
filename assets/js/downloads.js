$(document).ready( function () {
    $('#downloads').DataTable( {
      "order": [[ 2, 'desc' ]],
      columnDefs: [ {
        targets: 2,
        render: $.fn.dataTable.render.moment( 'DD MMM YYYY' )
      } ]
    } );
} );
