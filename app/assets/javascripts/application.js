// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require gistfile1
//= require ckeditor/init
//= require turbolinks
//= require_tree .

$('marquee').marquee(optionalClass);


// for jquery.turbolinks
$(document).on('page:fetch', function() {
  // $(".loading-indicator").show();
  $(".preloader").fadeIn();
  // $(".sk-cube-grid").fadeIn();
});

$(document).on('page:update', function() {
  $(".preloader").fadeIn();
});

$(document).on('page:change', function() {
  // $(".loading-indicator").hide();
  // $(".preloader").hide();
  $(".preloader").hide();
});
