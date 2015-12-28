var projectSearch = projectSearch || {};

projectSearch.setup = function() {
  console.log('setting js search up');
  $('.projects-filter').on('submit', projectSearch.searchHandler);
};

projectSearch.searchHandler = function(e) {
  e.preventDefault();
  projectSearch.ajaxRequest({
    'search': $('#search').val(),
    'category_id': $('#category_id').val(),
    'loc': $('#loc').val()
  });
};

projectSearch.updateProjects = function(data) {
  console.log(data);

};

projectSearch.ajaxRequest = function(data) {
  var ajaxOptions = {
    url: '/projects',
    contentType: "application/json; charset=utf-8",
    type: 'GET',
    dataType: 'json',
    data: data
  };
  return $.ajax(ajaxOptions)
  .success(projectSearch.updateProjects);
}

$(document).ready(function() {
  projectSearch.setup(); 
});
