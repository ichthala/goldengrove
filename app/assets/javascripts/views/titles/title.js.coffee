class Goldengrove.Views.Title extends Backbone.View

  template: HandlebarsTemplates['titles/title']

  initialize: (options) =>
    @title = options.title
    @title.image = '/assets/' + @title.image

  render: =>
    console.log 'rendering one title'
    console.log @title
    $(@el).html @template @title
    this
