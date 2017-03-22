//= require jquery
//= require jquery_ujs
//= require shared/bootstrap.min
//= require turbolinks
//= require_self

$(document).on('turbolinks:load', function() {
  // reattach callback
  $(".notification").fadeTo(3000, 500).slideUp(500, function() {
      $(".notification").slideUp(500);
  });
});

