$(document).ready ->
  convert = ->
    alert "Ola q tal"
    return false
    $.ajax '/convert',
        type: 'GET'
        dataType: 'json'
        data: {
          source_currency: $('#source_currency').val(),
          target_currency: $('#target_currency').val(),
          amount: $('#amount').val()
        }
        error: (jqXHR, textStatus, errorThrown) ->
          alert textStatus
        success: (data, text, jqXHR) ->
          $('#result').html(data.value.toFixed 2)

  $('#amount').on 'keyup', (e) ->
    e.preventDefault()
    if $('form').attr('action') == '/convert'
      if $('#amount').val() == ''
        $('#error-message').addClass('alert alert-danger')
        $('#error-message').html('Digite a quantidade.')
        return false
      convert()
      return false

  $('.invert').click ->
    source_currency = $('#source_currency').val()
    target_currency = $('#target_currency').val()
    $('#source_currency').val(target_currency)
    $('#target_currency').val(source_currency)
    convert()