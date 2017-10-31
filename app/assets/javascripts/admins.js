//= require jquery
//= require jquery_ujs
//= require shared/bootstrap.min
//= require shared/chosen.jquery.min
//= require shared/jquery.dataTables
//= require ckeditor/init
//= require_self

$(document).ready(function() {
  // reattach callback
  $(".notification").fadeTo(3000, 500).slideUp(500, function() {
    $(".notification").slideUp(500);
  });

  // reattach chosen jquery
  $('.chosen').chosen({
    width: '100%',
    no_results_text: 'No channels matches',
    placeholder_text_multiple: 'Select channels'
  });

  initDynamicFields();
});

// for dynamic job vacancy requirement
function initDynamicFields() {
  var field_sample = $(".req-field").html();
  if(field_sample !== undefined) {
    $(".req-field .req-add").off("click");
    $(".req-field .req-add").on("click", function(e) {
      var insertAfter = $(".req-field .input-group").has($(this));
      $(insertAfter).clone()
                    .insertAfter(insertAfter)
                    .find("input")
                    .val("");
      initDynamicFields();
    });

    $(".req-field .req-remove").off("click");
    $(".req-field .req-remove").on("click", function(e) {
      var parent_field = $(".req-field .input-group").has($(this));
      var parent_children_count = $(parent_field).parent().children().length;
      var first_parent_child = $(".form-group").has($(parent_field));

      if(parent_children_count > 1) {
        $(parent_field).remove();
        initDynamicFields();
      }
    });
  }
}

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
