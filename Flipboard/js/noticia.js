$(document).ready(function(){
    $('.your-class').slick({
          dots: false,
          infinite: false,
          speed: 300,
          slidesToShow: 8,
          slidesToScroll: 7,
          responsive: [
            {
              breakpoint: 1024,
              settings: {
                slidesToShow: 7,
                slidesToScroll: 6
              }
            },
            {
              breakpoint: 1000,
              settings: {
                slidesToShow: 5,
                slidesToScroll: 5
              }
            },
            {
              breakpoint: 900,
              settings: {
                slidesToShow: 3,
                slidesToScroll: 3
              }
            }
            // You can unslick at a given breakpoint now by adding:
            // settings: "unslick"
            // instead of a settings object
          ]
      });
    $('[data-toggle="popover"]').popover();
});

function ajustarContenedorNoticias(){
    var altoNavbar = $(".iconos-derecha").height() + 40;
    $('#contenido-principal').css("margin-top",altoNavbar+"px");
    var anchoIntereses = $(window).width() - $(".iconos-derecha").width()-170;
    $('.your-class').css("width",anchoIntereses+"px");
}

function cargarNoticias(codigo){
	data = "codigo="+codigo;
	$.ajax({ 
		//url que recibe para ser visualizada en el div de contenido principal         
        url : "ajax/noticias.php",
        data: data,
        method: "POST",
        beforeSend: function() {
        	$('#contenido-principal').html('Loading');//buscar un loading decente!!!!           
        },
        success: function(datos){       
            $('#contenido-principal').html(datos+ $('#contenido-principal').html());
            $(function () {
			  $('[data-toggle="popover"]').popover();
			})
        }
    });	
}

cargarNoticias(1);