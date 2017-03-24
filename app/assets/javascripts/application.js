//= require jquery
//= require jquery_ujs
//= require shared/bootstrap.min
//= require turbolinks

$(document).on('turbolinks:load', function() {
  // smooth scroll
  $("a[href^='#']").on('click', function(e) {
    e.preventDefault();

    var hash = this.hash;

    $('html, body').animate({
      scrollTop: $(hash).offset().top
    }, 500, function() {
      window.location.hash = hash;
    });
  });
});
