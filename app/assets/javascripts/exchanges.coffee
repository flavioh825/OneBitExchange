$(document).ready ->
  convert = ->    
    $.ajax '/convert',
      type: 'GET'
      dataType: 'json'
      data: {
        source_currency: $('#source_currency').val(),
        target_currency: $('#target_currency').val()
        amount: $('#amount').val()
      }
      error: (jqXHR, textStatus, errorThrown) ->
        alert textStatus
      success: (data, text, jqXHR) ->
        $('#result').html(data.value.toFixed 2)

  convert_cryptocoins = ->    
    $.ajax '/cryptocoin_convert',
      type: 'GET'
      dataType: 'json'
      data: {
        source_cryptocoin: $('#source_currency').val(),
        target_cryptocoin: $('.cryptocoin').val(),
        amount: $('#amount').val()
      }
      error: (jqXHR, textStatus, errorThrown) ->
        alert textStatus
      success: (data, text, jqXHR) ->
        $('#result').html(data.value)

  $('#amount').on 'keyup', (e) ->
    e.preventDefault()
    if $('form').attr('action') == '/convert'
      if $('#amount').val() == ''
        $('#error-message').addClass('alert alert-danger')
        $('#error-message').html('Digite a quantidade.')
        return false
      
      if $('#cryptocoin_checkbox').is(':checked')
        convert_cryptocoins() # if cryptocoin mode activated
      else
        convert()
      
      return false

  $('.invert').click ->
    source_currency = $('#source_currency').val()
    target_currency = $('#target_currency').val()
    $('#source_currency').val(target_currency)
    $('#target_currency').val(source_currency)
    convert()