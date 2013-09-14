define ["jquery", "underscore", "backbone", "handlebars", "text!../templates/home.hbs"], ($, _, Backbone, Handlebars, homeTemplate) ->
  'use strict'
  
  class HomeView extends Backbone.View
    
    template: Handlebars.compile(homeTemplate)

    initialize: ->
      @render()

    render: ->
      $(@el).html(@template)
