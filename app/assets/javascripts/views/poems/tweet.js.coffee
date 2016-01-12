class Goldengrove.Views.Tweet extends Backbone.View

  template: HandlebarsTemplates['poems/tweet']

  className: 'row tweet-row'

  initialize: (options) =>
    @tweet = options.tweet
    @text = options.tweet.text
    @poem_box = options.poem_box

  render: =>
    $(@el).html @template
    @render_tweet_words @text
    this

  render_tweet_words: =>
    words = @text.split(/\s+/)
    _.each words, (word) =>
      word_view = new Goldengrove.Views.TweetWord
        word: word
        className: 'tweet-word'
        poem_box: @poem_box
      @$('.tweet').append(word_view.render().el)
