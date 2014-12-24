class Goldengrove.Collections.Titles extends Backbone.Collection

  url: '/titles'

  model: Goldengrove.Models.Title

  # xxx don't love this
  initialize: (array) ->
    models = _.map array, (item) ->
      new Goldengrove.Models.Title(item)
    super(models)
