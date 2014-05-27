class Goldengrove.Views.SourceUsersIndex extends Backbone.View

  template: HandlebarsTemplates['source_users/index']

  className: 'orbit-container'

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
    $(@el).html @template
    _.each @users, (user) =>
      su_view = new Goldengrove.Views.SourceUser
        user: user
        poems_new_view: @poems_new_view
      $('#random-box').append(su_view.render().el)
    this
