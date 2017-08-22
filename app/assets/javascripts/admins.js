//= require jquery
//= require jquery_ujs
//= require shared/bootstrap.min
//= require shared/chosen.jquery.min
//= require shared/jquery.dataTables
//= require turbolinks
//= require_self

$(document).on('turbolinks:load', function() {
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
  var offset = $(".req-field").data("offset-class");
  var field_sample = $(".req-field").html();
  if(field_sample !== undefined) {
    $(".req-field .req-add").off("click");
    $(".req-field .req-add").on("click", function(e) {
      var insertAfter = $(".req-field").has($(this));
      $(insertAfter).clone()
                    .insertAfter(insertAfter)
                    .addClass(offset)
                    .find("input")
                    .val("");
      initDynamicFields();
    });

    $(".req-field .req-remove").off("click");
    $(".req-field .req-remove").on("click", function(e) {
      var parent_field = $(".req-field").has($(this));
      var parent_children_count = $(parent_field).parent().children().length - 1;
      var first_parent_child = $(".form-group").has($(parent_field));

      if(parent_children_count > 1) {
        $(parent_field).remove();
        initDynamicFields();
      }

      $(first_parent_child).find(".req-field:first").removeClass(offset);
    });
  }
}
