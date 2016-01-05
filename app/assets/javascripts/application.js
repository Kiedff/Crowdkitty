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
//= require social-share-button
//= require_tree .


var crowdkittyApp = crowdkittyApp || {};

crowdkittyApp.setup = function() {
  $('#new_pledge').on('submit', crowdkittyApp.pledgeHandler);
  $('#main-picture-thumb').click($('#main-picture-thumb').attr('src'), crowdkittyApp.changePicture);
  $('#gallery-picture0').click($('#gallery-picture0').attr('src'), crowdkittyApp.changePicture);
  $('#gallery-picture1').click($('#gallery-picture1').attr('src'), crowdkittyApp.changePicture);
  $('#gallery-picture2').click($('#gallery-picture2').attr('src'), crowdkittyApp.changePicture);
  $('#gallery-picture3').click($('#gallery-picture3').attr('src'), crowdkittyApp.changePicture);
  $('#gallery-picture4').click($('#gallery-picture4').attr('src'), crowdkittyApp.changePicture);
  $('#gallery-picture5').click($('#gallery-picture5').attr('src'), crowdkittyApp.changePicture);
  $('#gallery-picture6').click($('#gallery-picture6').attr('src'), crowdkittyApp.changePicture);
};

crowdkittyApp.pledgeHandler = function() {
  $('#successful-pledge').slideDown()
};

crowdkittyApp.changePicture = function(e) {
  console.log(e.data);
  $('#main-image').attr('src', e.data)
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
        response(data);
      });
    },
    select: function( event, ui ) {
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


