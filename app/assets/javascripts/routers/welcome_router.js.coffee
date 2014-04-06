class Goldengrove.Routers.Welcome extends Backbone.Router
  routes:
    '': 'index'

  index: ->
    view = new Goldengrove.Views.WelcomeIndex()
    $('#welcome-container').html(view.render().el)
