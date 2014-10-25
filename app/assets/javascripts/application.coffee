#= require jquery
#= require jquery_ujs
#= require turbolinks
#= require jquery.pjax
#= require_tree .

$ ->
  $(document).pjax '.show-feed-item', '#feed-item'
  $('#feed-item').bind 'pjax:end', ->
    $(@).scrollTop(0)
