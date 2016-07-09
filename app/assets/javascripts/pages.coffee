# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $("input.datepicker").each (i) ->
    $(this).datepicker
    altFormat: "yy-mm-dd"
    dateFormat: "dd/mm/yy"
    altField: $(this).next()