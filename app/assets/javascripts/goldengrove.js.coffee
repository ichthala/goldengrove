window.Goldengrove =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
    new Goldengrove.Routers.Welcome()
    Backbone.history.start
      pushState: true

$(document).ready ->
  Goldengrove.initialize()
