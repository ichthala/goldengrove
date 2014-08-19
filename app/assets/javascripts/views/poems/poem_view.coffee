class Goldengrove.Views.PoemView extends Backbone.View

  template: HandlebarsTemplates['poems/poem']

  render: =>
    console.log @model.toJSON()
    console.log @model.toJSON().user?.twitter_handle
    $(@el).html @template @model.toJSON()
