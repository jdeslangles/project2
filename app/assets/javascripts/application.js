// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require imagesLoaded.pkgd
//= require masonry.pkgd
//= require jquery.isotope
//= require_tree .


$(function() {
    var $portfolio = $('#portfolio');
    var cssinitial;
    $portfolio.imagesLoaded( function() {
        $portfolio.masonry({
          columnWidth: 170,
          itemSelector: '.item',
          gutterWidth: 20
        });



        $('body #portfolio img.thumb').on('click', function(event) {
          initialWidth = $portfolio.find('.item:first').width();
          initialHeight = $portfolio.find('.item:first').height();
          cssinitial =  {width:initialWidth, height:initialHeight};
        // $portfolio.find('img.thumb').on('click', function(event) {

          // Close all unfolded element
          $portfolio.find('.unfold').removeClass('unfold').css(cssinitial);

          // Unfold this
          unfold = $(this).closest('.item').addClass('unfold');
          // Reload masonry
          $portfolio.masonry();

          // Animate unfolding
          var widthfinal = unfold.width();
          var heightfinal = unfold.height();
          unfold.animate({
            width:widthfinal,
            height:heightfinal
          });
        });



        $('body #portfolio img.full').on('click', function(event) {
        // $portfolio.find('img.full').on('click', function(event) {
          $(this).closest('.item').removeClass('unfold').css(cssinitial);
          $portfolio.masonry();
        });
    });
});


