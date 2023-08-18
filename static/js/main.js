
// owlcarousel

$('#slider').owlCarousel({
    loop:true,
    margin:20,
    nav:true,
    responsiveClass: true,
    autoplayTimeout:1300,
    autoplayHoverPause:true,
    responsive:{
        0:{
            items:1,
            autoplay: true,
            
        },
        600:{
            items:3,
            autoplay: true
        },
        1000:{
            items:5,
            autoplay: true,
        }
    }
})




$(document).ready(function () {
    // Handler for .ready() called.
    $('html, body').animate({
        scrollTop: $('#Register,#login').offset().top
    }, 'slow');
});