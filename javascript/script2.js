$(document).ready(function () {
  $("input[type=radio]").change(function () {
    if ($("#connection-invite-other-radio").is(":checked")) {
      $("#connection-invite-other").show();
    } else {
      $("#connection-invite-other").hide();
    }
  });
});

function myFunction() {
  var x = document.getElementById("frm1");
  var title = x.elements[0].value;
  var dt = x.elements[1].value;
  var res = x.elements[4].value;
  window.open(
    "http://localhost:8984/rest?run=mytest.xq&mytitle=" +
      title +
      "&myrank=" +
      dt +
      "&mydate=" +
      res
  );
}
