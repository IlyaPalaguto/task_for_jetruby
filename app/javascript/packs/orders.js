$(document).on("turbolinks:load", function () {
  $(".orders").on("click", "tr", function (e) {
    var orderId = $(this).data("orderId");
    document.location.href = "/orders/" + orderId;
  });
});
