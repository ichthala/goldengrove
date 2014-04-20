class Goldengrove.Views.SourceUsersIndex extends Backbone.View

  template: HandlebarsTemplates['source_users/index']

  initialize: (options) =>
    @poems_new_view = options.poems_new_view
    @users = {}
    $.ajax
      url: '/source_users'
      type: 'GET'
      dataType: 'json'
      complete: (data) =>
        @users = data.responseJSON
        @render()

  render: =>
    _.each @users, (user) =>
      su_view = new Goldengrove.Views.SourceUser
        user: user
        poems_new_view: @poems_new_view
      $(@el).append(su_view.render().el)
    this
