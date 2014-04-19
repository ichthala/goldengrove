class Goldengrove.Views.SourceUsersIndex extends Backbone.View

  template: HandlebarsTemplates['source_users/index']

  initialize: =>
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
      su_view = new Goldengrove.Views.SourceUser(user)
      $(@el).append(su_view.render().el)
    this
