$(document).ready ->
  Registration.addAutocompletes()

@Registration = ->

Registration.addAutocompletes = ->
  Registration.favoriteBooksAutocomplete()
  Registration.favoriteMoviesAutocomplete()
  Registration.sportsWatchAutocomplete()
  Registration.sportsPlayAutocomplete()
  Registration.diningsAutocomplete()
  Registration.vacationsAutocomplete()
  Registration.hobbiesAutocomplete()

Registration.favoriteBooksAutocomplete = ->
  $('#interests_favorite_books').autocomplete
    source: $('#interests_favorite_books').data('autocomplete-source'),
    select: (event, ui) ->
      $('#interests_favorite_books').val(ui.item)

Registration.favoriteMoviesAutocomplete = ->
  $('#interests_favorite_movies').autocomplete
    source: $('#interests_favorite_movies').data('autocomplete-source'),
    select: (event, ui) ->
      $('#interests_favorite_movies').val(ui.item)

Registration.sportsWatchAutocomplete = ->
  $('#interests_sport_watch').autocomplete
    source: $('#interests_sport_watch').data('autocomplete-source'),
    select: (event, ui) ->
      $('#interests_sport_watch').val(ui.item)

Registration.sportsPlayAutocomplete = ->
  $('#interests_sport_play').autocomplete
    source: $('#interests_sport_play').data('autocomplete-source'),
    select: (event, ui) ->
      $('#interests_sport_play').val(ui.item)

Registration.diningsAutocomplete = ->
  $('#interests_dinings').autocomplete
    source: $('#interests_dinings').data('autocomplete-source'),
    select: (event, ui) ->
      $('#interests_dinings').val(ui.item)

Registration.vacationsAutocomplete = ->
  $('#interests_vacations').autocomplete
    source: $('#interests_vacations').data('autocomplete-source'),
    select: (event, ui) ->
      $('#interests_vacations').val(ui.item)

Registration.hobbiesAutocomplete = ->
  $('#interests_hobbies').autocomplete
    source: $('#interests_hobbies').data('autocomplete-source'),
    select: (event, ui) ->
      $('#interests_hobbies').val(ui.item)
