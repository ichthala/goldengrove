class Goldengrove.Views.UsersShow extends Backbone.View

  template: HandlebarsTemplates['users/show']

  initialize: (options) =>
    @user = options.model
    @user.on 'poems_set', @render

  render: =>
    $(@el).html @template @user.toJSON()
    poems = @user.poems
    if poems
      _.each poems, (poem) =>
        console.log poem
        view = new Goldengrove.Views.PoemView(model: poem).render()
        @$('#user-poems').append(view)
    this
