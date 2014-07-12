$(document).ready(function(){
  $('#events-container').hide();

  $('#events-btn').on('click', function(e){
    $('#events-container').show();
    $('.launch-info-users').hide();
    e.preventDefault();
  })

  $('#users-btn').on('click', function(e){
    $('.launch-info-users').show();
    $('#events-container').hide();
    e.preventDefault();
  })

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
