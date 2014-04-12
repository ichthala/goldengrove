class Goldengrove.Routers.Welcome extends Backbone.Router
  routes:
    '': 'index'
    'poems/new': 'poems_new'

  index: =>
    view = new Goldengrove.Views.WelcomeIndex()
    $('#welcome-container').html(view.render().el)

  poems_new: =>
    view = new Goldengrove.Views.PoemsNew()
    $('#poem-container').html(view.render().el)
