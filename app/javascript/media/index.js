document.addEventListener("turbolinks:load", function() {
  $("#media").sortable({
    update: function(e, ui) {
      // console.log($(this).sortable('serialize'));
      $.ajax({
        url: $(this).data("url"),
        type: "PATCH",
        data: $(this).sortable('serialize'),
      });
    }
  });
});
