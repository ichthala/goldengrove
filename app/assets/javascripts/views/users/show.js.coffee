class Goldengrove.Views.UsersShow extends Backbone.View

  template: HandlebarsTemplates['users/show']

  initialize: =>
    @user = Goldengrove.CurrentUser
    console.log @user

  render: =>
    $(@el).html @template @user
    this
