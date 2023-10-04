$(document).ready(function(){
	$('.slider').bxSlider({
		nextText: '<i class="fas fa-chevron-right"></i>',
	    prevText: '<i class="fas fa-chevron-left"></i>',
	    pager: false,
		auto : true,
		speed: 550
	});
	
	$('.multiple_slider').bxSlider({
		minSlides:5,
		maxSlides:5,
		moveSlides: 1,
		slideWidth: 230,
		slideMargin:10,
		auto: true,
		pager: false,
		controls: true,
		speed: 600,
		pause: 3000,
		autoHover: true,
		touchEnabled : false,
		nextText: '<i class="fas fa-chevron-right"></i>',
	    prevText: '<i class="fas fa-chevron-left"></i>'
	});
});

function layon(no)  {
	 var d=document;
	 for (i=1;i<8;i++) { laynm="layer0"+i;
		 if (i==Number(no))  {d.all[laynm].style.display="block"; }
		 	else  { d.all[laynm].style.display="none"; };
		 }
	 }
