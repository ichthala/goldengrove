class Goldengrove.Views.UsersShow extends Backbone.View

  template: HandlebarsTemplates['users/show']

  initialize: (options) =>
    @user = options.model
    @user.on 'change', @render

  render: =>
    $(@el).html @template @user
    this
