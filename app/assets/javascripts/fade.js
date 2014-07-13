$(document).ready(function(){
  $('#posts-container, .new-post-link-container').hide();

  $('#posts-btn').on('click', function(e){
    $('#posts-container, .new-post-link-container').show();
    $('.launch-info-users, .launch-info-options, .launch-info-search, #sort-columns').hide();
    e.preventDefault();
  })

  $('#users-btn').on('click', function(e){
    $('.launch-info-users, .launch-info-options, .launch-info-search, #sort-columns').show();
    $('#posts-container, .new-post-link-container').hide();
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
