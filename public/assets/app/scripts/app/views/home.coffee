define ["jquery", "underscore", "backbone", "app/views/tweet"], ($, _, Backbone, TweetView) ->
  'use strict'
  
  class HomeView extends Backbone.View

    events:
      "click #add-user"   : "addUser"
      "click #get-tweets" : "getTweets"

    initialize: ->
      $(".loading").hide()
      @users = []

    addUser: ->
      term = $("#user-name").val()
      $("#added-users").append(@getTempl(term)) if term and term.length > 0
      @users.push term if term and term.length > 0
      $("#user-name").val("")
      $("#user-name").focus()

    getTempl: (term) ->
      '<span class="success label">' +  term + '</span>'

    getTweets: ->
      $(".loading").show()
      $.get("/user_timeline", {users: JSON.stringify(@users)}, @handleSuccess)

    handleSuccess: (data) =>
      tweetView = new TweetView({el: "#tweet-view", model: data})
      tweetView.render()
      $(".loading").hide()

