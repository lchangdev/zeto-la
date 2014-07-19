$(document).ready(function(){

  // user#index posts
  $('#posts-container, .new-post-link-container, #sort-posts').hide();

  $('#posts-btn').on('click', function(e){
    $('#posts-container, .new-post-link-container, #sort-posts').show();
    $('.launch-info-users, .launch-info-options, #sort-columns').hide();
    e.preventDefault();
  })

  $('#users-btn').on('click', function(e){
    $('.launch-info-users, .launch-info-options, #sort-columns').show();
    $('#posts-container, .new-post-link-container, #sort-posts').hide();
    e.preventDefault();
  })

  // post#index tables
  $('.my-posts-table, .events-attending-table').hide();

  $('.my-posts-btn').on('click', function(e){
    $('.my-posts-table').show();
    $('.all-posts-table, .events-attending-table').hide();
    e.preventDefault();
  })

  $('.all-posts-btn').on('click', function(e){
    $('.all-posts-table').show();
    $('.my-posts-table, .events-attending-table').hide();
    e.preventDefault();
  })

  $('.events-attending-btn').on('click', function(e){
    $('.events-attending-table').show();
    $('.all-posts-table, .my-posts-table').hide();
    e.preventDefault();
  })

  // buttons
  $('.enter-btn, .initial-enter-btn').mouseenter(function(){
    $(this).fadeTo('medium', 0.6);
  });

  $('.enter-btn, .initial-enter-btn').mouseleave(function(){
    $(this).fadeTo('medium', 1);
  });

  // collapse
  $('#collapse-trigger').mouseenter(function(){
    $(this).fadeTo('medium', 1);
  });

  $('#collapse-trigger').mouseleave(function(){
    $(this).fadeTo('medium', 0.7);
  });

  // cohort colors
  var randExperienceEngineer = randomColor({hue: 'orange'});
  var randWinter2013 = randomColor({hue: 'blue'});
  var randSpring2014 = randomColor({hue: 'pink'});
  var randSummer2014 = randomColor({hue: 'monochrome'});
  var randFall2014 = randomColor({hue: 'green'});
  var randWinter2014 = randomColor({hue: 'purple'});

  $('.experienceengineer').css("color", "#F89406"); // orange
  $('.launchstaff').css("color", "#F89406"); // orange
  $('.hiringpartner').css("color"," #F1A9A0"); // pink
  $('.winter2013').css("color", "#6163c6"); // blue
  $('.spring2014').css("color", "#e871ae"); // pink
  $('.summer2014').css("color", "#848484"); // grey
  $('.fall2014').css("color", "#D24D57"); // red
  $('.winter2014').css("color"," #8855e0"); // purple
});
