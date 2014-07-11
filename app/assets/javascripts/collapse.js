$(document).ready(function(){})

$("#collapse-trigger").on("click", function() {
  var e = $(this);
  if (e.text() == e.data("text-swap")) {
    e.text(e.data("collapse"));
  } else {
    e.data("collapse", e.text());
    e.text(e.data("text-swap"));
  }
});
