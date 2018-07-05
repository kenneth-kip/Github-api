$(document).on 'turbolinks:load', () ->
  getData = (request, response) ->
    base_url = window.location.origin
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
