class Goldengrove.Models.Poem extends Backbone.Model

  urlRoot: '/poems'

  initialize: (opts) ->
    super(opts)
    @set
      text_for_display: @generate_display_text()

  generate_display_text: ->
    @get('text').replace("\n", "<br>")
