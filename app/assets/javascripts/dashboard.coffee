$(document).on 'turbolinks:load', () ->
  base_url = window.location.origin

  getData = (request, response) ->
    $.getJSON base_url + '/autocomplete/?q=' + request.term, (data) ->
      response data
      return
    return

  selectUser = (event, ui) ->
    $(".search-user").attr("action", "/dashboard/" + ui.item.value + "/")
    $(".search-user").submit()

  $('.typeahead').autocomplete
    source: getData
    minLength: 2
    select: selectUser
    messages:
      noResults: ''
      results: ->
  
  location = $('#location').html().replace('<b>Location:</b> ', '')
  
  if window.location.href == "http://localhost:3000/"
    location = $('#location').html().replace('<b>Location:</b> ', '')
    $.getJSON "https://api.github.com/search/users?q=+followers:%3E200+location:%3D" + location + "&per_page=5", (result) ->
      $.each result.items, (i, field) ->
        profile_url = '<a href="dashboard/' + field.login + '">' + field.login + '</a>'
        console.log(profile_url)
        $('.popular-profiles').append '<li class="list-group-item">' + (i + 1) + '. ' + profile_url + '</li>'
        return
      return
