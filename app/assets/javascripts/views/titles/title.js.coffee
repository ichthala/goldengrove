class Goldengrove.Views.Title extends Backbone.View

  template: HandlebarsTemplates['titles/title']

  initialize: (options) =>
    options.model.set('image', ('/assets/' + options.model.get('image')))

  render: =>
    $(@el).html @template @model.toJSON()
    this
