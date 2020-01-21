$(document).ready(function(){
    $('#world-map').vectorMap({
      map: 'world_mill',
      focusOn: {
        region: 'US',
        x: 0.1,
        y: 0.1,
        scale: 2.5,
        animate: true
      },
      series: {
        regions: [{
          values: membershipData,
          scale: ['#C8EEFF', '#0071A4'],
          normalizeFunction: 'polynomial'
        }]
      },
      onRegionTipShow: function(e, el, code){
        if (membershipData[code]) {
          el.html(el.html()+' ('+membershipData[code]+')');
        } else {
          el.html(el.html()+' (0)');
        }
      }
    });

    $(".filter-button").click(function(){
        var value = $(this).attr('data-filter');

        if(value == "all")
        {
            //$('.filter').removeClass('hidden');
            $('.filter').show('1000');
        }
        else
        {
//            $('.filter[filter-item="'+value+'"]').removeClass('hidden');
//            $(".filter").not('.filter[filter-item="'+value+'"]').addClass('hidden');
            $(".filter").not('.'+value).hide('3000');
            $('.filter').filter('.'+value).show('3000');

        }
    });

    if ($(".filter-button").removeClass("active")) {
$(this).removeClass("active");
}
$(this).addClass("active");

});
