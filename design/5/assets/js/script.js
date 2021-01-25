 /* ------------------------------------------------------------------

[Script Code ]

 1. Navigation Bar Code
 2. Preloader Code
 3. AOS Animations Code
 4. Qty for Add And Subtract Product Code
 5. Oty for Add And Subtract Product for Mobile Code
 6. Tilt Effects For Home Page Slider 
 7. Initialising Home Page Slider
 8. Open and Close Modal Code of Connect Us Form and Thank You
 9. Shop Page Hover Effect JS 
 10. Initialising Team Page Slider
 11. Initialising Team Detail Page Slider
 12. Initialising Service Page Slick Slider
 13. Initialising Price Page Slick Slider For Mobile
 14. Initialising Portfolio v1 Page Slider
 15. Adding Active Class to Indicators Portfolio Page v2 
 16. Initialising Case Study v3 Page Slider
 17. Initialising Blog List v1 Page Slider
 18. Initialising Blog List v2 Page Slider
 19. Initialising Blog List v3 Page Slider
 20. Initialising Shop Detail v3 Page Accordion
 21. Initialising Slides of Portfolio v3 



 ------------------------------------------------------------------ */


 /* --------------------------
  1. Navigation Bar Header Js Code Starts Here
  -------------------------- */

  $(document).ready( function() {

  	$('#nav-toggle').on('click', function() {
  		$( ".close" ).trigger( "click" );
  		if ($(this).hasClass("navBtnActive") ) 
  		{
  			$( "#bs-navbar" ).animate({ left: "-100%"}, 300 );
  			$(this).removeClass('navBtnActive');
  			$('body').removeClass('scroll-stop');
  		} 
  		else 
  		{
  			$( "#bs-navbar" ).animate({ left: "0" }, 300 );
  			$(this).addClass('navBtnActive');
  			$('body').addClass('scroll-stop');
  		} 
  	});

  	$('.close').on('click', function() {
  		$( "#bs-navbar" ).animate({ left: "-100%"}, 300 );
  		$("#nav-toggle").removeClass('navBtnActive');
  		$('body').removeClass('scroll-stop');
  	});


  	$('.dropdown').on('click', function() {
  		var target_id = $(this).attr('data-toggle');
  		$('.sub-menu').not(target_id).slideUp();
  		$(target_id).slideToggle();
  		$('.sub-menu').not(target_id).parents('li').removeClass('active');
  		$('.dropdown').not(this).parents(' .icon-tab').removeClass('active');
  		$(this).parents('li').toggleClass('active');
  	});
  });

  $(document).ready(function(){
  	$(".dropdown ").on('click', function() {
  		$(".sub-menu").addClass("no-effect");
  	});
  });

 /* --------------------------
 Navigation Bar Header Js Code Ends Here
 -------------------------- */


 /* --------------------------
  2. On Window Load Js Code Starts Here
  -------------------------- */

  $(function() {
  	$('body').removeClass('fade-out');
  });
  $(window).on('load', function(){
  	$(".se-pre-con").fadeOut("slow");
  	$("body").removeClass("preload");
  	$("body").addClass("loaded");
  });

 /* --------------------------
   On Window Load Js Code Ends Here
   -------------------------- */


 /* --------------------------
  3. AOS Animation Starts Here
  -------------------------- */

  $(window).on("load", function() {
  	AOS.init({
  		duration: 400,
      // disable: 'mobile',
      easing:'linear',
  })
  });

$(window).on("load", function() { setTimeout(function() { AOS.refresh(); }, 500); });


 /* --------------------------
   AOS Animation Ends Here
   -------------------------- */

 /* --------------------------
  4. Qty + - Js Code Starts Here
  -------------------------- */

  jQuery(document).ready(function(){
    // This button will increment the value
    $('[data-quantity="plus"]').on('click', function(e) {
        // Stop acting like a button
        e.preventDefault();
        // Get the field name
        fieldName = $(this).attr('data-field');
        // Get its current value
        var currentVal = parseInt($('input[name='+fieldName+']').val());
        // If is not undefined
        if (!isNaN(currentVal)) {
            // Increment
            $('input[name='+fieldName+']').val(currentVal + 1);
        } else {
            // Otherwise put a 0 there
            $('input[name='+fieldName+']').val(0);
        }
    });
    // This button will decrement the value till 0
    $('[data-quantity="minus"]').on('click', function(e) {
        // Stop acting like a button
        e.preventDefault();
        // Get the field name
        fieldName = $(this).attr('data-field');
        // Get its current value
        var currentVal = parseInt($('input[name='+fieldName+']').val());
        // If it isn't undefined or its greater than 0
        if (!isNaN(currentVal) && currentVal > 0) {
            // Decrement one
            $('input[name='+fieldName+']').val(currentVal - 1);
        } else {
            // Otherwise put a 0 there
            $('input[name='+fieldName+']').val(0);
        }
    });
});

/* --------------------------
  Qty + - Js Code Ends Here
  -------------------------- */

 /* --------------------------
  5. Qty + - Js Code Starts Here For Mobile
  -------------------------- */

  jQuery(document).ready(function(){
    // This button will increment the value
    $('.qtyplus').on('click', function(e){
        // Stop acting like a button
        e.preventDefault();
        // Get the field name
        fieldName = $(this).attr('data-field');
        // Get its current value
        var currentVal = parseInt($('input[name='+fieldName+']').val());
        // If is not undefined
        if (!isNaN(currentVal)) {
            // Increment
            $('input[name='+fieldName+']').val(currentVal + 1);
        } else {
            // Otherwise put a 0 there
            $('input[name='+fieldName+']').val(0);
        }
    });
    // This button will decrement the value till 0
    $(".qtyminus").on('click', function(e) {
        // Stop acting like a button
        e.preventDefault();
        // Get the field name
        fieldName = $(this).attr('data-field');
        // Get its current value
        var currentVal = parseInt($('input[name='+fieldName+']').val());
        // If it isn't undefined or its greater than 0
        if (!isNaN(currentVal) && currentVal > 0) {
            // Decrement one
            $('input[name='+fieldName+']').val(currentVal - 1);
        } else {
            // Otherwise put a 0 there
            $('input[name='+fieldName+']').val(0);
        }
    });
});

 /* --------------------------
 Qty + - Js Code Ends Here For Mobile
 -------------------------- */

 /* --------------------------
  6. Tilt Effects Js Code Starts Here
  -------------------------- */

  const tilt = $('.js-tilt').tilt();
  $('.js-destroy').on('click', function () {
  	const element = $(this).closest('.js-parent').find('.js-tilt');
  	element.tilt.destroy.call(element);
  });
  $('.js-getvalue').on('click', function () {
  	const element = $(this).closest('.js-parent').find('.js-tilt');
  	const test = element.tilt.getValues.call(element);
  	console.log(test[0]);
  });
  $('.js-reset').on('click', function () {
  	const element = $(this).closest('.js-parent').find('.js-tilt');
  	element.tilt.reset.call(element);
  });

 /* --------------------------
   Tilt Effects Js Code Ends Here
   -------------------------- */


 /* --------------------------
  7.Initialising Home Page Slick Slider Js Code Starts Here
  -------------------------- */

  $(document).ready(function(){
  	$('.lazy').slick({
  		slidesToShow: 2,
  		slidesToScroll: 1,
  		autoplay: false,
  		arrows: true,
  		infinite: false,
  		dots: false,
  		responsive: [{
  			breakpoint: 768,
  			settings: {
  				slidesToShow: 2
  			}
  		}, {
  			breakpoint: 520,
  			settings: {
  				slidesToShow: 1
  			}
  		}]
  	});
  });

  /* --------------------------
 Initialising Home Page Slick Slider Js Code Ends Here
 -------------------------- */

 /* --------------------------
  8. Open and Close Connect Us and Thank You Modal Js Code Starts Here
  -------------------------- */

  $(".new-btn").on('click', function(){
  	$(".contact-form-modal").hide();
  });
  $(".close-icon").on('click', function(){
  	$(".contact-form-modal").show();
  	$(".contact-form-modal1").hide();
  });
  $("#hereingresult").on('click', function(){
  	$(".contact-form-modal").show();
  	$(".contact-form-modal1").hide();
  });
  $("#subts").on('click', function(){
  	$(".contact-form-modal1").show();
  });

   /* --------------------------
   Open and Close Connect Us and Thank You Modal Js Code Ends Here
   -------------------------- */

/* --------------------------
  9. Shop Page Hover Effect Visible Item Js Code Starts Here
  -------------------------- */

  $(document).ready(function(){
  	$(".p-thumbnail").mouseover("hover",function(){
  		var thumHtml = $('.p-dynamic-content',this).html();
  		var thumImage = $(this).css("background-image");
  		var thumId = $(this).attr("id");
  		$(".p-thumbnail.move").removeClass("move");
  		$(this).addClass("move");

  		setTimeout(function(){ 
  			$(".portfolio-detail , .portfolio-image").removeClass("move");
  			$(".portfolio-detail").html(thumHtml);
  		}, 100);
  		setTimeout(function(){ 
  			$(".portfolio-detail , .portfolio-image").addClass("move");
  			$(".portfolio-image").css("background-image",thumImage,);
  			$(".portfolio-image").attr("data-class",thumId);
  		}, 300);
  	})
  });

   /* --------------------------
   Shop Page Hover Effect Visible Item Js Code Ends Here
   -------------------------- */


 /* --------------------------
  10. Initialising Team Page Slick Slider Js Code Starts Here
  -------------------------- */

  $(document).ready(function(){
  	$('.team-page .blog-slider').slick({
  		slidesToShow: 4,
  		slidesToScroll: 1,
  		autoplay: true,
  		autoplaySpeed: 6500,
  		arrows: true,
  		dots: false,
  		pauseOnHover: false,
  		responsive: [{
  			breakpoint: 1025,
  			settings: {
  				slidesToShow: 2
  			}
  		}, {
  			breakpoint: 520,
  			settings: {
  				slidesToShow: 1
  			}
  		}]
  	});
  });

  /* --------------------------
 Initialising Team Page Slick Slider Js Code Ends Here
 -------------------------- */

 /* --------------------------
  11. Initialising Team Detail Page Slick Slider Js Code Starts Here
  -------------------------- */

  $(document).ready(function(){
  	$('.team-member-page .blog-slider').slick({
  		slidesToShow: 1,
  		slidesToScroll: 1,
  		autoplay: false,
  		arrows: true,
  		dots: false,
  		pauseOnHover: false,
  		responsive: [{
  			breakpoint: 768,
  			settings: {
  				slidesToShow: 1
  			}
  		}, {
  			breakpoint: 520,
  			settings: {
  				slidesToShow: 1
  			}
  		}]
  	});
  });

  /* --------------------------
 Initialising Team Detail Page Slick Slider Js Code Ends Here
 -------------------------- */


  /* --------------------------
  12. Initialising Service Page Slick Slider Js Code Starts Here
  -------------------------- */

  $(document).ready(function(){
  	$('.service-page .blog-slider').slick({
  		slidesToShow: 4,
  		slidesToScroll: 1,
  		autoplay: true,
  		autoplaySpeed: 6500,
  		arrows: true,
  		dots: false,
  		pauseOnHover: false,
  		responsive: [{
  			breakpoint: 1025,
  			settings: {
  				slidesToShow: 2,
  				arrows: false,
  				dots: true
  			}
  		}, {
  			breakpoint: 520,
  			settings: {
  				slidesToShow: 1,
  				arrows: false,
  				dots: true
  			}
  		}]
  	});
  });

  /* --------------------------
  Initialising Service Page Slick Slider Js Code Ends Here
  -------------------------- */


  /* --------------------------
  13. Initialising Price Page Slick Slider Js Code Starts Here
  -------------------------- */

  $(document).ready(function(){
  	$('.price-page .blog-slider').slick({
  		slidesToShow: 3,
  		slidesToScroll: 1,
  		autoplay: true,
  		autoplaySpeed: 6500,
  		arrows: true,
  		dots: false,
  		pauseOnHover: false,
  		responsive: [{
  			breakpoint: 1025,
  			settings: {
  				slidesToShow: 1,
  				arrows: false,
  				dots: true,
  			}
  		}, {
  			breakpoint: 520,
  			settings: {
  				slidesToShow: 1,
  				arrows: false,
  				dots: true,
  			}
  		}]
  	});
  });

   /* --------------------------
  Initialising Price Page Slick Slider Js Code Ends Here
  -------------------------- */

  /* --------------------------
  14. Initialising Portfolio v1 Page Slider Js Code Starts Here
  -------------------------- */

  $(document).ready(function(){
// invoke the carousel
$('#mycarousel').carousel({
	interval: false,
	wrap: false
});

// scroll slides on mouse scroll 
$('#mycarousel').on('mousewheel DOMMouseScroll', function(e){
	if(e.originalEvent.wheelDelta > 0 || e.originalEvent.detail < 0) {
		$(this).carousel('prev');
	}
	else{
		$(this).carousel('next');
	}
});

//scroll slides on swipe for touch enabled devices 

$("#mycarousel").on("touchstart", function(event){
	var yClick = event.originalEvent.touches[0].pageY;
	$(this).one("touchmove", function(event){
		var yMove = event.originalEvent.touches[0].pageY;
		if( Math.floor(yClick - yMove) > 1 ){
			$(".carousel").carousel('next');
		}
		else if( Math.floor(yClick - yMove) < -1 ){
			$(".carousel").carousel('prev');
		}
	});
	$(".carousel").on("touchend", function(){
		$(this).off("touchmove");
	});
});

});

 /* --------------------------
  Initialising Portfolio v1 Page Slider Js Code Ends Here
  -------------------------- */

  /* --------------------------
  15. Adding Active Class to Indicators Portfolio Page v2 Js Code Starts Here
  -------------------------- */

  $(document).ready(function(){
  	$('.sec-portfolio .blog-indicators li').on('click', function(){
  		$(this).addClass('active').siblings().removeClass('active');
  	});
  });

  /* --------------------------
  Adding Active Class to Indicators Portfolio Page v2 Js Code Ends Here
  -------------------------- */


 /* --------------------------
  16. Initialising Case Study v3 Page Slider Js Code Starts Here
  -------------------------- */

  	$(document).ready(function(){
				$('.blog-detail-three .blog-slider').slick({
					slidesToShow: 4,
					slidesToScroll: 1,
					autoplay: true,
					autoplaySpeed: 3500,
					arrows: true,
					dots: false,
					pauseOnHover: false,
					responsive: [{
						breakpoint: 768,
						settings: {
							slidesToShow: 3
						}
					}, {
						breakpoint: 520,
						settings: {
							slidesToShow: 2
						}
					}]
				});
			});

 /* --------------------------
 Initialising Case Study v3 Page Slider Js Code Ends Here
  -------------------------- */


 /* --------------------------
  17. Initialising Blog List v1 Page Slider Js Code Starts Here
  -------------------------- */

$(document).ready(function(){
					$('.blog-list-page .blog-slider').slick({
						slidesToShow: 3,
						slidesToScroll: 1,
						autoplay: true,
						autoplaySpeed: 16500,
						arrows: true,
						dots: false,
						pauseOnHover: false,
						responsive: [{
							breakpoint: 1200,
							settings: {
								slidesToShow: 2
							}
						}, {
							breakpoint: 992,
							settings: {
								slidesToShow: 1
							}
						}]
					});
				});

 /* --------------------------
 Initialising Blog List v1 Page Slider Js Code Ends Here
  -------------------------- */

 /* --------------------------
  18. Initialising Blog List v2 Page Slider Js Code Starts Here
  -------------------------- */

  	$(document).ready(function(){
				$('.blog-listing-two .blog-slider').slick({
					slidesToShow: 4,
					slidesToScroll: 1,
					autoplay: false,
					autoplaySpeed: 6500,
					arrows: false,
					dots: true,
					pauseOnHover: false,
					responsive: [{
						breakpoint: 1200,
						settings: {
							slidesToShow: 2
						}
					}, {
						breakpoint: 520,
						settings: {
							slidesToShow: 1
						}
					}]
				});
			});

  	 /* --------------------------
 Initialising Blog List v2 Page Slider Js Code Ends Here
  -------------------------- */

 /* --------------------------
  19. Initialising Blog List v3 Page Slider Js Code Starts Here
  -------------------------- */

  $(document).ready(function(){
			$('.blog-listing-three .blog-slider').slick({
				slidesToShow: 2,
				slidesToScroll: 2,
				autoplay: false,
				autoplaySpeed: 6500,
				arrows: false,
				dots: true,
				pauseOnHover: false,
				responsive: [{
					breakpoint: 994,
					settings: {
						slidesToShow: 1,
						slidesToScroll: 1,
						arrows: true,
						dots: false,
					}
				}, {
					breakpoint: 520,
					settings: {
						slidesToShow: 1,
						slidesToScroll: 1,
						arrows: true,
						dots: false,
					}
				}]
			});
		});

  /* --------------------------
 Initialising Blog List v3 Page Slider Js Code Ends Here
  -------------------------- */


/* --------------------------
  20. Initialising Shop Detail v2 Page Accordion Js Code Starts Here
  -------------------------- */

  $('.accordion').on('click', function() {
					$(this).find('.panel').show();
					$(this).siblings().find('.panel').hide();

				});

  /* --------------------------
Initialising Shop Detail v2 Page Accordion Js Code Ends Here
  -------------------------- */

/* --------------------------
  21. Initialising Slides of Portfolio v3 Js Code Starts Here
  -------------------------- */

  var STATE = {
  'ui': 'light',

  'common': {
    'visible': true,
    'staticHeader': true
  },
  'background': {
    'id': '',
    'effect': 0
  }
};

/* --------------------------
 Initialising Slides of Portfolio v3 Js Code Ends Here
  -------------------------- */

