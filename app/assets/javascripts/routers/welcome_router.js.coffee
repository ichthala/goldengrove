class Goldengrove.Routers.Welcome extends Backbone.Router
  routes:
    '': 'index'
    'poems/new': 'poems_new'

  index: =>
    view = new Goldengrove.Views.WelcomeIndex()
    $('#welcome-container').html(view.render().el)

  poems_new: =>
    console.log 'poems_new'
    view = new Goldengrove.Views.PoemsNew()
    console.log view.render
    $('#poem-container').html(view.render().el)
