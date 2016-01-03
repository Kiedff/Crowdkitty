// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require turbolinks
//= require jquery-ui
//= require_tree .


var crowdkittyApp = crowdkittyApp || {};

// function filter(data) {
//   $.each(data, function(i, project) {

// }

// function ajaxRequest(data) {
//   var ajaxOptions = {
//     url: '/projects',
//     type: 'GET',
//     data: data
//   };
//   return $.ajax(ajaxOptions).success(filter);
// }

crowdkittyApp.setup = function() {
  console.log('setting up');
  // $('.projects-filter').on('submit', crowdkittyApp.searchHandler);
  $('#new_pledge').on('submit', crowdkittyApp.pledgeHandler);
};

// crowdkittyApp.searchHandler = function(e) {
//   e.preventDefault();
//   console.log('search');
//   ajaxRequest({
//     'search': $('#search').val(),
//     'loc': $('#loc').val(),
//     'category_id': $('#category_id').val()
//   });
// };

// function pledgeAjaxRequest(data) {
//   var ajaxOptions = {
//     url: '/projects/12/pledges',
//     type: 'POST',
//     data: data
//   };
//   return $.ajax(ajaxOptions).success();
// }

crowdkittyApp.pledgeHandler = function(e) {
  console.log('pledge');
  // e.preventDefault();
  // pledgeAjaxRequest({
  //   'user_id': $('#user_id').val(),
  //   'project_id': $('#project_id').val(),
  //   'value': $('#pledge_value').val()
  // });
  $('#successful-pledge').slideDown()
};

$(document).ready(function() {
  crowdkittyApp.setup(); 
});

$(function() {

  $("#location_search").autocomplete({ 
    source: function (request, response) {
      $.get("/projects/autocomplete_locations", {
        q: request.term
      }, function (data) {
        console.log(data);
        response(data);
      });
    },
    select: function( event, ui ) {
      console.log(ui);
      event.preventDefault();

      var checkbox = '<li><input checked="checked" id="project_location_id" name="project[location_id]" type="checkbox" value="' + ui.item.id + '" /><label>' + ui.item.value + '</label></li>';

      $('#location_autocomplete').attr('style', 'display: none');
      $('#project_location_id').attr('value', ui.item.id);
      $('#location').attr('value', ui.item.id);
      $('#location_checkbox > label').attr('for', ui.item.value).html(ui.item.value);
      $("#project_location_id").prop("checked", true);
      $('#selected_location').html(ui.item.value + ' <i class="fa fa-times"></i>');
      $('#selected_location').attr('style', 'display: inline');
    }
  });

  $("#selected_location").click(function(){
    $('#location_autocomplete').attr('style', 'display: inline');
    $('#selected_location').attr('style', 'display: none');
    $('#location').attr('value', null);

  });

});


