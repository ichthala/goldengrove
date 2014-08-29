class Goldengrove.Views.PoemView extends Backbone.View

  template: HandlebarsTemplates['poems/poem']

  render: =>
    $(@el).html @template @model.toJSON()
    this
