class Goldengrove.Views.UsersShow extends Backbone.View

  template: HandlebarsTemplates['users/show']

  initialize: (options) =>
    @user = options.model
    @user.on 'change', @render

  render: =>
    $(@el).html @template @user.toJSON()
    @poems = @user.toJSON().poems
    if @poems
      _.each @poems, (poem) =>
        console.log poem
        view = new Goldengrove.Views.PoemView(model: poem).render()
        @$('#user-poems').append(view)
    this
