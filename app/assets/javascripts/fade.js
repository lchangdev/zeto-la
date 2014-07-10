$(document).ready(function(){
  $('.enter-btn, .user-info').mouseenter(function(){
    $(this).fadeTo('medium', 0.6);
  });
  $('.enter-btn, .user-info').mouseleave(function(){
    $(this).fadeTo('medium', 1);
  });
});
