$(document).ready(function(){
  $('.enter-btn, .initial-enter-btn').mouseenter(function(){
    $(this).fadeTo('medium', 0.6);
  });
  $('.enter-btn, .initial-enter-btn').mouseleave(function(){
    $(this).fadeTo('medium', 1);
  });

  $('#collapse-trigger').mouseenter(function(){
    $(this).fadeTo('medium', 1);
  });
  $('#collapse-trigger').mouseleave(function(){
    $(this).fadeTo('medium', 0.7);
  });
});
