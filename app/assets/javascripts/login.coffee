$(document).ready ->
  $("form.login-form").on("ajax:success", (e, data, status, xhr) ->
    console.log "oki"
    $("#new_driver").append xhr.responseText
  ).bind "ajax:error", (e, xhr, status, error) ->
    console.log "error"