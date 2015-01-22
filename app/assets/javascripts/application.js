// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require twitter/bootstrap
//= require turbolinks
//= require_tree .
$(function(){
  $('.book_button').on('click', function(){
    num = this.id.split("_").pop();
    string = "#booking_form_" + num;
    $('.booking_form').slideUp();
    $(string).slideDown();
  });
  $('.lesson_button').on('click', function(){
    $('#add_lesson_form').slideToggle();
  });
  $('.conversation_form').hide();
  $('#new_conversation').on('click', function(){
    $('.conversation_form').slideToggle();
  });
  $('#search_form').
    on('ajax:success', function(ev, data, status, xhr){
      $('#lessons_list').html(data);
    }).
    on('ajax:error', function(xhr, status, error){
      console.log('error: ', error);
    });
    $('#search').on('keyup',function(){
      $('#search_form').submit();
    });
  $('select').on('change', function(){
    lesson = this.id.split("_")[0];
    url = document.URL;
    year_element = document.getElementById(lesson + "_booking_start_time_1i");
    month_element = document.getElementById(lesson + "_booking_start_time_2i");
    day_element = document.getElementById(lesson + "_booking_start_time_3i");
    year_value = year_element.options[year_element.selectedIndex].value;
    month_value = month_element.options[month_element.selectedIndex].value;
    day_value = day_element.options[day_element.selectedIndex].value;
    string = year_value + "-" + month_value + "-" + day_value;
    data = {string: string};
    $.ajax({
      type: "POST",
      url: url,
      data: data,
      success: function(response){
        var new_times = response.options;
        $('#booking_time').empty();
        for(var i=0; i<new_times.length; i++){
          $('#booking_time').append('<option value='+new_times[i]+'>'+new_times[i]+'</option>');
        }
      },
      error: function(response){
        console.log("error");
      }
    });
  });
});




