class Goldengrove.Views.UsersShow extends Backbone.View

  template: HandlebarsTemplates['users/show']

  initialize: (options) ->
    @user = options.model

  render: ->
    @$el.html @template _.extend @user.toJSON(),
      titles_empty: @user.get('titles')?.length == 0,
      poems_empty: @user.get('poems')?.length == 0
    @_render_titles()
    @_render_poems()
    this

  _render_titles: ->
    titles = @user.get('titles')
    if titles
      titles.each (title) =>
        view = new Goldengrove.Views.Title(model: title)
        @$('.titles').append(view.render().el)

    small_block_grid_size = Math.min(titles.length, 2)
    medium_block_grid_size = Math.min(titles.length, 3)
    @$('.titles').addClass("small-block-grid-#{small_block_grid_size} medium-block-grid-#{medium_block_grid_size}")

  _render_poems: ->
    poems = @user.get('poems')
    if poems
      poems.each (poem) =>
        view = new Goldengrove.Views.PoemView(model: poem)
        @$('#user-poems').append(view.render().el)
