define ["jquery", "underscore", "backbone", "handlebars", "text!../templates/tweet.hbs"], ($, _, Backbone, Handlebars, tweetTemplate) ->
  'use strict'

  class TweetView extends Backbone.View

    template: Handlebars.compile(tweetTemplate)

    initialize: ->
      

    render: ->
      $(@el).html(@template(tweets: @model))
