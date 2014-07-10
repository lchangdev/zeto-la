$(document).ready(function(){
  $('.enter-btn, .user-info, .initial-enter-btn').mouseenter(function(){
    $(this).fadeTo('medium', 0.6);
  });
  $('.enter-btn, .user-info, .initial-enter-btn').mouseleave(function(){
    $(this).fadeTo('medium', 1);
  });

  // $('#header, #tagline-container').hide();
  // $('#left-overlay').mouseenter(function(){
  //   $(this).fadeOut('fast', function(){
  //     $('#header, #tagline-container').fadeIn('slow');
  //   });
  // });
  // $('.left-screen').mouseleave(function(){
  //   $('#header, #tagline-container').fadeOut('fast', function(){
  //     $('#left-overlay').fadeIn('slow');
  //   });
  //   $('#header, #tagline-container').hide();
  // });
});
