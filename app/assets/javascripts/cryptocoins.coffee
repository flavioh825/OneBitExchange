$(document).ready ->
  $('.cryptocoin').css('display', 'none')

  $('#cryptocoin_checkbox').change ->
    if $('#cryptocoin_checkbox').is(':checked')
      $('.cryptocoin').css('display', 'block')
      $('.currency').css('display', 'none')
      $('.card-header').css('background-color', '#8F03BF')
      $('.card-footer').css('background-color', '#8F03BF')
      $('#amount').css('background-color', '#8F03BF')
      $('#amount').val('')
      $('#result').html('0.00')
      $('.btn-invert').css('display', 'none')
    else
      $('.cryptocoin').css('display', 'none')
      $('.currency').css('display', 'block')
      $('.card-header').css('background-color', '#007bff')
      $('.card-footer').css('background-color', '#007bff')
      $('#amount').css('background-color', '#007bff')
      $('.btn-invert').css('display', 'block')