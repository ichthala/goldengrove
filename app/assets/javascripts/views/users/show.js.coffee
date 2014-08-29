class Goldengrove.Views.UsersShow extends Backbone.View

  template: HandlebarsTemplates['users/show']

  initialize: (options) =>
    @user = options.model
    @user.set_poem_collection()

  render: =>
    $(@el).html @template @user.toJSON()
    @render_poems()
    this

  render_poems: =>
    poems = @user.poems
    if poems
      poems.each (poem) =>
        view = new Goldengrove.Views.PoemView(model: poem)
        @$('#user-poems').append(view.render().el)
