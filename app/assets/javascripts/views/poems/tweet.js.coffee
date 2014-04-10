class Goldengrove.Views.Tweet extends Backbone.View

  template: HandlebarsTemplates['poems/tweet']

  initialize: (options) =>
    @tweet = options.tweet
    @poem_box = options.poem_box

  render: =>
    $(@el).html @template
    @render_tweet_words @tweet
    this

  render_tweet_words: =>
    words = @tweet.split(' ')
    _.each words, (word) =>
      word_view = new Goldengrove.Views.TweetWord
        word: word
        poem_box: @poem_box
      $(@el).append(word_view.render().el)
