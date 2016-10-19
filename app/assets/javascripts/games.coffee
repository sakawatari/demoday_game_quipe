# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'ready page:load', ->
    $('#game-tags').tagit
        fieldName:   'game[tag_list]'
        singleField: true
        availableTags: gon.available_tags
        
    if gon.game_tags?
        for tag in gon.game_tags
            $('#game-tags').tagit 'createTag', tag