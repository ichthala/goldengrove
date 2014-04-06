class Goldengrove.Views.PoemBox extends Backbone.View

  template: HandlebarsTemplates['poems/poem_box']

  render: =>
    console.log 'poem box render'
    $(@el).html @template
    this
