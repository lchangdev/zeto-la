$(document).ready(function(){
  $('.enter-btn').mouseenter(function(){
    $(this).fadeTo('medium', 0.6);
  });
  $('.enter-btn').mouseleave(function(){
    $(this).fadeTo('medium', 1);
  });
});
