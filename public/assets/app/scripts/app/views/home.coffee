define ["jquery", "underscore", "backbone", "app/views/tweet"], ($, _, Backbone, TweetView) ->
  'use strict'
  
  class HomeView extends Backbone.View

    events:
      "click #add-user"    : "addUser"
      "click #get-tweets"  : "getTweets"
      "click .remove-user" : "removeUser"

    initialize: ->
      $(".loading").hide()
      @users = []
      @unfavorited = []

    addUser: ->
      term = $("#user-name").val()
      $("#added-users").append(@getTempl(term)) if term and term.length > 0
      @users.push term if term and term.length > 0
      $("#user-name").val("")
      $("#user-name").focus()

    removeUser: (e) ->
      elem = $(e.currentTarget)
      elem.parent().hide()
      @unfavorited.push elem.data("user-name")

    getTempl: (term) ->
      '<span class="success label">' +  term + '<a href="#" data-user-name="'+ term + '" class="remove-user">&times;</a></span>'

    getTweets: ->
      $(".loading").show()
      $.get("/tweets", {users: JSON.stringify(@users), unfavorited: JSON.stringify(@unfavorited)}, @handleSuccess)

    handleSuccess: (data) =>
      tweetView = new TweetView({el: "#tweet-view", model: data})
      tweetView.render()
      $(".loading").hide()

