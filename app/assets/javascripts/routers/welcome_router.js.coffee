class Goldengrove.Routers.Welcome extends Backbone.Router
  routes:
    '': 'index'
    'poems': 'poems_index'
    'poems/new': 'poems_new'
    'users/:id': 'user_profile'

  poems_index: =>
    collection = new Goldengrove.Collections.Poems()
    view = new Goldengrove.Views.PoemsIndex(collection: collection)
    collection.fetch
      reset: true

  index: =>
    view = new Goldengrove.Views.WelcomeIndex()
    $('#welcome-container').html(view.render().el)

  poems_new: =>
    view = new Goldengrove.Views.PoemsNew()
    $('#poem-container').html(view.render().el)

  user_profile: (id) =>
    # todoxxx cleanup
    $.ajax
      url: "/users/#{id}"
      type: 'GET'
      dataType: 'json'
      success: (data) ->
        view = new Goldengrove.Views.UsersShow
          model: data
        $('#user-container').html(view.render().el)
