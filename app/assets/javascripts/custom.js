$(document).ready(function(){
  $('#posts-container, .new-post-link-container, #sort-posts').hide();

  $('#posts-btn').on('click', function(e){
    $('#posts-container, .new-post-link-container, #sort-posts').show();
    $('.launch-info-users, .launch-info-options, .launch-info-search, #sort-columns').hide();
    e.preventDefault();
  })

  $('#users-btn').on('click', function(e){
    $('.launch-info-users, .launch-info-options, .launch-info-search, #sort-columns').show();
    $('#posts-container, .new-post-link-container, #sort-posts').hide();
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

  var randExperienceEngineer = randomColor({hue: 'orange'});
  var randWinter2013 = randomColor({hue: 'blue'});
  var randSpring2014 = randomColor({hue: 'pink'});
  var randSummer2014 = randomColor({hue: 'monochrome'});
  var randFall2014 = randomColor({hue: 'green'});
  var randWinter2014 = randomColor({hue: 'purple'});

  $('.experienceengineer').css("color", randExperienceEngineer);
  $('.launchstaff').css("color", randExperienceEngineer);
  $('.winter2013').css("color", randWinter2013);
  $('.spring2014').css("color", randSpring2014);
  $('.summer2014').css("color", randSummer2014);
  $('.fall2014').css("color", randFall2014);
  $('.winter2014').css("color", randWinter2014);

});
