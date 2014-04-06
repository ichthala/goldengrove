class Goldengrove.Views.TweetWord extends Backbone.View

  template: HandlebarsTemplates['poems/tweet_word']

  initialize: (word) =>
    @word = word

  render: =>
    $(@el).html @template
      word: @word
    this
