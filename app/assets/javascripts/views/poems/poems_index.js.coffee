class Goldengrove.Views.PoemsIndex extends Backbone.View

  el: '#poem-container'

  template: HandlebarsTemplates['poems/index']

  initialize: (options) =>
    @page = 1
    @collection.on 'reset', @render

  render: =>
    $(@el).html @template
    $(window).on('scroll', @_autoload_next_page)

    window.poems_collection = @collection
    @collection.each (poem) =>
      view = new Goldengrove.Views.PoemView(model: poem)
      @$('#poems-index').append(view.render().el)

  _autoload_next_page: =>
    if $(window).scrollTop() >= ($(document).height() - $(window).height())
      $.ajax
        url: '/poems'
        dataType: 'json'
        data:
          page: @page += 1
        success: (response) =>
          # xxx this is dreadful
          poem_models = _.map response, (poem_json) ->
            user = new Goldengrove.Models.User(poem_json.user)
            delete poem_json.user
            poem = new Goldengrove.Models.Poem(poem_json)
            poem.set('user', user)
            poem

          _.each poem_models, (poem) =>
            view = new Goldengrove.Views.PoemView(model: poem)
            @$('#poems-index').append(view.render().el)
