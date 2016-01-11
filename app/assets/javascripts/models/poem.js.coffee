class Goldengrove.Models.Poem extends Backbone.Model

  urlRoot: '/poems'

  initialize: (opts) ->
    super(opts)
    @set
      text_for_display: @generate_display_text()

  generate_display_text: ->
    # TODO: sanitize input
    @get('text').split("\n").join("<br>")

  save: (callback, should_tweet) ->
    $.ajax
      url: '/poems'
      type: 'POST'
      dataType: 'json'
      data:
        poem:
          text: @get('text')
          source_user: Goldengrove.current_source_user.get('screen_name')
        share: false
      complete: (data) =>
        callback(data)
