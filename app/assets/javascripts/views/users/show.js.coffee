class Goldengrove.Views.UsersShow extends Backbone.View

  template: HandlebarsTemplates['users/show']

  initialize: (options) =>
    @user = new Goldengrove.Models.User({id: options.id})
    @user.fetch()
    console.log @user.attributes
    console.log @user.toJSON()

  render: =>
    $(@el).html @template @user.toJSON()
    this
