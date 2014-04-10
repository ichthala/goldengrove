class Goldengrove.Views.TweetWord extends Backbone.View

  template: HandlebarsTemplates['poems/tweet_word']

  events:
    'click': 'append_to_poem'

  initialize: (options) =>
    @word = options.word
    @poem_box = options.poem_box

  render: =>
    $(@el).html @template
      the_word: @word
    this

  append_to_poem: =>
    @poem_box.append_word($(@el).html())
