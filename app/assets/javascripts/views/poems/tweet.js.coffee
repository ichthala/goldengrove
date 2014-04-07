class Goldengrove.Views.Tweet extends Backbone.View

  template: HandlebarsTemplates['poems/tweet']

  initialize: (tweet) =>
    console.log 'tweet init'
    @tweet = tweet

  render: =>
    console.log 'tweet render'
    $(@el).html @template
    @render_tweet_words @tweet
    this

  render_tweet_words: =>
    words = @tweet.split(' ')
    _.each words, (word) =>
      word_view = new Goldengrove.Views.TweetWord(word)
      $(@el).append(word_view.render().el)
