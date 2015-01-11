class Goldengrove.Views.PoemsIndex extends Backbone.View

  el: '#poem-container'

  template: HandlebarsTemplates['poems/index']

  initialize: (options) =>
    @collection.on 'reset', @render

  render: =>
    $(@el).html @template
    window.poems_collection = @collection
    @collection.each (poem) =>
      view = new Goldengrove.Views.PoemView(model: poem)
      @$('#poems-index').append(view.render().el)
