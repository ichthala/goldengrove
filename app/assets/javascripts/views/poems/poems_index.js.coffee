class Goldengrove.Views.PoemsIndex extends Backbone.View

  el: '#poem-container'

  template: HandlebarsTemplates['poems/index']

  initialize: (options) =>
    @collection.on 'reset', @render

  render: =>
    console.log @collection
    $(@el).html @template @collection
