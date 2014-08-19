class Goldengrove.Views.PoemsIndex extends Backbone.View

  el: '#poem-container'

  template: HandlebarsTemplates['poems/index']

  initialize: (options) =>
    @collection.on 'reset', @render

  render: =>
    $(@el).html @template
    @collection.each (poem) =>
      view = new Goldengrove.Views.PoemView(model: poem).render()
      @$('#poems-index').append(view)
