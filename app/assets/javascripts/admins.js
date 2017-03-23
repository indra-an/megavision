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

  initVacancyRequirements();
});

// for dynamic job vacancy requirement
function initVacancyRequirements() {
  var requirement_field_sample = $(".req-field").html();
  if(requirement_field_sample !== undefined) {
    $(".req-field .req-add").off("click");
    $(".req-field .req-add").on("click", function(e) {
      $(".req-field:last").clone()
                          .insertAfter(".req-field:last")
                          .addClass("col-sm-offset-2")
                          .find("input")
                          .val("");
      initVacancyRequirements();
    });

    $(".req-field .req-remove").off("click");
    $(".req-field .req-remove").on("click", function(e) {
      if($(".req-field").length > 1) {
        $(".req-field:last").remove();
        initVacancyRequirements();
      }
    });
  }
}
