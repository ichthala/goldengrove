class Goldengrove.Views.Title extends Backbone.View

  template: HandlebarsTemplates['titles/title']

  initialize: (options) =>
    @title = options.title
    @title.image = '/assets/' + @title.image

  render: =>
    $(@el).html @template @title
    this
