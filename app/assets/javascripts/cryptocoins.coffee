$(document).ready ->
  $('#cryptocoin_checkbox').change ->
    if $('#cryptocoin_checkbox').is(':checked')
      $('.card-header').css('background-color', '#8F03BF')
      $('.card-footer').css('background-color', '#8F03BF')
      $('#amount').css('background-color', '#8F03BF')
      $('.invert').css('background-color', '#8F03BF')
      $('.invert').css('border-color', '#8F03BF')
    else
      $('.card-header').css('background-color', '#007bff')
      $('.card-footer').css('background-color', '#007bff')
      $('#amount').css('background-color', '#007bff')
      $('.invert').css('background-color', '#007bff')
      $('.invert').css('border-color', '#007bff')