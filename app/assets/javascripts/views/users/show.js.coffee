class Goldengrove.Views.UsersShow extends Backbone.View

  template: HandlebarsTemplates['users/show']

  initialize: (options) =>
    @user = options.model

  render: =>
    $(@el).html @template @user
    this
