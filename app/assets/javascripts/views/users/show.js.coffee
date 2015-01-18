class Goldengrove.Views.UsersShow extends Backbone.View

  template: HandlebarsTemplates['users/show']

  initialize: (options) ->
    @user = options.model

  render: ->
    @$el.html @template @user.toJSON()
    @render_titles()
    @render_poems()
    this

  render_titles: ->
    titles = @user.get('titles')
    if titles
      titles.each (title) =>
        view = new Goldengrove.Views.Title(model: title)
        @$('.titles').append(view.render().el)
    @$('.titles').addClass("small-block-grid-#{@user.get('titles').length}")

  render_poems: ->
    poems = @user.get('poems')
    if poems
      poems.each (poem) =>
        view = new Goldengrove.Views.PoemView(model: poem)
        @$('#user-poems').append(view.render().el)
