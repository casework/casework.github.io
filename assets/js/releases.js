$(document).ready( function () {
    $('#releases').DataTable( {
      "order": [[ 1, 'desc' ]],
      columnDefs: [ {
        targets: 1,
        render: $.fn.dataTable.render.moment( 'DD MMM YYYY' )
      } ]
    } );
} );
