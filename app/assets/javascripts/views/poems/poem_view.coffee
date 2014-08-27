class Goldengrove.Views.PoemView extends Backbone.View

  template: HandlebarsTemplates['poems/poem']

  render: =>
    console.log 'render'
    console.log @model
    $(@el).html @template @model.toJSON()
