var pledge = pledge || {};

pledge.confirmPledge = function() {
  $('#submit_pledge').slideUp(function(){
    $('#submit_pledge').attr('value', "Thank you!");
  });
  $('#submit_pledge').slideDown();
  $('#submit_pledge').slideUp(function(){
    $('#submit_pledge').attr('value', "Claim this reward!");
  });
  $('#submit_pledge').slideDown(); 
};

pledge.setup = function() {
  $('#submit_pledge').on('click', pledge.confirmPledge);
};


$(document).ready(function() {
  pledge.setup(); 
});