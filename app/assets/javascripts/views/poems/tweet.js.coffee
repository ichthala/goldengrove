class Goldengrove.Views.Tweet extends Backbone.View

  template: HandlebarsTemplates['poems/tweet']

  # tagName: 'li'
  # className: 'tweet'

  initialize: (options) =>
    @tweet = options.tweet
    @text = options.tweet.text
    @poem_box = options.poem_box

  render: =>
    $(@el).html @template
    @render_tweet_words @text
    this

  render_tweet_words: =>
    words = @text.split(' ')
    _.each words, (word) =>
      word_view = new Goldengrove.Views.TweetWord
        word: word
        poem_box: @poem_box
      @$('.tweet').append(word_view.render().el)
