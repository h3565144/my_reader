#= require jquery
#= require jquery_ujs
#= require turbolinks
#= require jquery.pjax
#= require_tree .

$ ->
  $(document).pjax '.show-item', '#item'
  $('.show-item').on 'pjax:click', ->
    $('.item').removeClass 'active'
    $(@).parent().addClass 'active'
  $('#item').bind 'pjax:end', ->
    $(@).scrollTop(0)
