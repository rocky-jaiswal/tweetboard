define ["jquery", "backbone", "app/views/home", "app/views/login"], ($, Backbone, HomeView, LoginView) ->
  'use strict'

  class Init
    
    @init: ->
      mapping =
        "#login-view" : LoginView
        "#home-view"  : HomeView

      initialized = {}
      
      for selector, view of mapping
        if $("body").has(selector).length isnt 0
          view = new view({el: selector}) unless initialized[selector]
          initialized[selector] = true