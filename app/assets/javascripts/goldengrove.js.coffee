window.Goldengrove =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
    new Goldengrove.Routers.Welcome()
    Backbone.history.start()

$(document).ready ->
  Goldengrove.initialize()
