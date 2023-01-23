 // $(".openbtn").click(function () {
 //    $(this).toggleClass('active');
 // });
$(document).on('turbolinks:load', function() {
 $(function() {
  $(".burger").click(function () {
     $(".burger").toggleClass("active");
     $(".menu").toggleClass("active");
  });
 });
});