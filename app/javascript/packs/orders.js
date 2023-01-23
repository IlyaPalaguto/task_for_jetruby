$(document).on("turbolinks:load", function () {
  $(".orders").on("click", "tr", function (e) {
    var orderId = $(this).data("orderId");
    document.getElementById("edit-link-" + orderId).click();
  });
});
