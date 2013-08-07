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
//= require_tree .

$(function() {
    var $portfolio = $('#portfolio');
    $portfolio.imagesLoaded( function() {
        $portfolio.masonry({
          columnWidth: 188,
          itemSelector: '.item',
          gutterWidth: 20
        });
        // $portfolio.find('img.thumb').each(function(index, image) {
        //   $(image).attr('data-orig-width', image.clientWidth);
        //   $(image).attr('data-orig-height', image.clientHeight);
        // });
        // $('body #portfolio img.thumb').on('click', function(event) {
        $portfolio.find('img.thumb').on('click', function(event) {
          var thumb = $(this),
                full = $(this).parent().find('img.full'),
                item = $(this).parent(),
                not_current = $portfolio.find('.item').not(item);
          not_current.each(function(index, current_item) {
            var current_thumb = $(current_item).find('img.thumb'),
                  current_item = $(current_item);
            current_thumb.removeAttr('height');
            current_thumb.attr('width', '150px');
            current_item.height('');
            current_item.width('150px');
            current_item.attr('data-scaled', 'false');
                        current_item.removeClass('unfold');
          });
          //$portfolio.masonry();
          if (item.attr('data-scaled') == "true") {
            // thumb.attr('height', thumb.attr('data-orig-height'));
            thumb.attr('width', '150px');
            // item.height(thumb.attr('data-orig-height'));
            item.width('150px');
            item.height('');
            item.attr('data-scaled', 'false');
                        item.removeClass('unfold');
          } else {
            thumb.attr('width', thumb.attr('data-full-width'));
            thumb.attr('height', thumb.attr('data-full-height'));
            item.width(thumb.attr('data-full-width'));
            item.height(parseInt(thumb.attr('data-full-height'), 10) + 50);
            item.attr('data-scaled', 'true');
            item.addClass('unfold');
          }
          // Reload masonry
          $portfolio.masonry();
        });
   // $('body #portfolio img.thumb').on('click', function(event) {
        // $portfolio.find('img.full').on('click', function(event) {
        //   var thumb = $(this).parent().find('img.thumb'),
        //         full = $(this),
        //         item = $(this).parent();
        //   $portfolio.masonry();
        // });
    });
});


function validateFiles(inputFile) {
  console.log(inputFile);
  var maxExceededMessage = "This file exceeds the maximum allowed file size (1 MB)";
  var extErrorMessage = "Only image file with extension: .jpg, .jpeg, .gif or .png is allowed";
  var allowedExtension = ["jpg", "jpeg", "gif", "png", "JPG", "JPEG", "GIF", "PNG"];

  var extName;
  var maxFileSize = $(inputFile).data('max-file-size');
  var sizeExceeded = false;
  var extError = false;

  $.each(inputFile.files, function() {
    if (this.size && maxFileSize && this.size > parseInt(maxFileSize)) {sizeExceeded=true;};
    extName = this.name.split('.').pop();
    if ($.inArray(extName, allowedExtension) == -1) {extError=true;};
  });
  if (sizeExceeded) {
    window.alert(maxExceededMessage);
    $(inputFile).val('');
  };

  if (extError) {
    window.alert(extErrorMessage);
    $(inputFile).val('');
  };
}
