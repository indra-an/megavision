//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require shared/bootstrap.min
//= require shared/bootstrap-datepicker
//= require shared/jquery.backstretch
//= require shared/classie
//= require shared/selectFx
//= require shared/jquery.dataTables
//= require turbolinks

$(document).on('turbolinks:load', function() {
  // reattach callback
  $(".notification").fadeTo(3000, 500).slideUp(500, function() {
    $(".notification").slideUp(500);
  });

  // smooth scroll
  $("a[href^='#']").on('click', function(e) {
    e.preventDefault();

    var hash = this.hash;

    if(!hash.includes("collapse")){
      $('html, body').animate({
        scrollTop: $(hash).offset().top
      }, 500, function() {
        window.location.hash = hash;
      });
    }

  });

});

function formatAMPM(date) {
  var hours = date.getHours();
  var minutes = date.getMinutes();
  var ampm = hours >= 12 ? 'pm' : 'am';
  hours = hours % 12;
  hours = hours ? hours : 12; // the hour '0' should be '12'
  minutes = minutes < 10 ? '0'+minutes : minutes;
  var strTime = hours + ':' + minutes + ' ' + ampm;
  return strTime;
}
