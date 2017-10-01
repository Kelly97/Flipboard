$(document).ready(function() {
	/*$("#btn-perfil").click(function() {
		abrirPerfil();
	});*/
	//buscar();
	cargarNoticias(0);//El cero será reservado para las noticias de portada, del 1 en adelante hará referencia a los intereses.
	ajustarContenedorNoticias();
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

	$('#btn-buscar').webuiPopover({
		url:'#btn-buscar-content',
		animation:'pop'
	});

	$('#btn-buscar').click(function(){
		if($('#txt-buscar').css("display")=="block"){
			$('#txt-buscar').focus();
		}
	});

	$('#btn-notificaciones').webuiPopover({
		   type:'async',
		   url:'ajax/notificaciones.php',
		   animation:'pop',
		   height:300
	});

	$('#btn-notificaciones').click(function(){
		WebuiPopovers.updateContentAsync('#btn-notificaciones','ajax/notificaciones.php');	
	});	

	$('#txt-buscar').change(function(){
		buscar();
		WebuiPopovers.hideAll();		
	});
	

	

});

$(document).scroll(function(e){
	WebuiPopovers.hideAll();
	e.stopPropagation();
});

$(window).resize(function(){
	ajustarContenedorNoticias();
});

function buscar(){
	var buscar = $('#txt-buscar').val();
	data = "buscar="+buscar;
	$.ajax({       
        url : "ajax/respuesta-busqueda.php",
        data: data,
        method: "POST",
        beforeSend: function() {
        	$('#contenido-principal').html('<div id="loading"><div id="loading-center-absolute"><div class="object" id="object_one"></div><div class="object" id="object_two"></div><div class="object" id="object_three"></div><div class="object" id="object_four"></div></div>');         
        },
        success: function(datos){       
            $('#contenido-principal').html(datos);
            $(function () {
			  $('[data-toggle="popover"]').popover();
			})
        }        
    });	
}

function ajustarContenedorNoticias(){
	var anchoNavbar= $("#iconos_derecha").width()+$('.navbar-brand').width()+$('.navbar-toggler').width()+60;
	var altoNavbar = $("#iconos_derecha").height();
	$('#contenido-principal').css("height",$(window).height()-altoNavbar);
	$('#pnProductNav').css("width",($(window).width()-anchoNavbar) +"px");
}

function cargarNoticias(codigo){
	data = "codigo="+codigo;
	$.ajax({       
        url : "ajax/noticias.php",
        data: data,
        method: "POST",
        beforeSend: function() {
        	$('#contenido-principal').html('<div id="loading"><div id="loading-center-absolute"><div class="object" id="object_one"></div><div class="object" id="object_two"></div><div class="object" id="object_three"></div><div class="object" id="object_four"></div></div>');         
        },
        success: function(datos){       
            $('#contenido-principal').html(datos);

            $(function () {
			  $('[data-toggle="popover"]').popover();
			})

			// init Isotope
			isotopeNotiCard();

			$(window).resize(function(){
				isotopeNotiCard();
			});
        }        
    });	
}

function perfilUsuario(){
	$('#contenido-principal').load('ajax/perfil.html', function(data) {
			$(this).html(data);
		});
}

function isotopeNotiCard(){
	var $grid = $('.grid').isotope({
	  itemSelector: '.noti-card',
	  percentPosition: true,			  
	  masonry: {
	    columnWidth: '.noti-card',
	    gutter: 15
	  }
	});
	// layout Isotope after each image loads
	$grid.imagesLoaded().progress( function() {
	  $grid.isotope('layout');
	});	
	var anchoGrid = $('.grid').width();
	var anchoNoticia = 0;
	if(anchoGrid < 576){
		anchoNoticia = 99;
	} else if(anchoGrid < 768){
		anchoNoticia = 99;
	} else if(anchoGrid < 992){
		anchoNoticia = 49;
	} else if(anchoGrid < 1200 || anchoGrid > 1200){
		anchoNoticia = 32;
	}
	$('.noti-card').css("width", anchoNoticia + "%" );
	  $grid.isotope({
	    // update columnWidth to a percentage of container width
	    masonry: { 
	    	columnWidth:  '.noti-card' ,
	    	gutter: 15
	    }
	  });
}



