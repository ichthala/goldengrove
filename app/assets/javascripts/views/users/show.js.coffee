class Goldengrove.Views.UsersShow extends Backbone.View

  template: HandlebarsTemplates['users/show']

  initialize: (options) =>
    @user = options.model
    @user.on 'change', @render

  render: =>
    console.log 'render'
    console.log @user
    $(@el).html @template @user.toJSON()
    this
