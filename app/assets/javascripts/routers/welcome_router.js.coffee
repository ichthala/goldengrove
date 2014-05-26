class Goldengrove.Routers.Welcome extends Backbone.Router
  routes:
    '': 'index'
    'poems/new': 'poems_new'
    'users/:id': 'user_profile'

  index: =>
    view = new Goldengrove.Views.WelcomeIndex()
    $('#welcome-container').html(view.render().el)

  poems_new: =>
    view = new Goldengrove.Views.PoemsNew()
    $('#poem-container').html(view.render().el)

  user_profile: (id) =>
    view = new Goldengrove.Views.UsersShow
      id: id
    $('#users-container').html(view.render().el)
