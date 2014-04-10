class Goldengrove.Views.TweetBox extends Backbone.View

  template: HandlebarsTemplates['poems/tweet_box']

  initialize: (options) ->
    @tweets = options.tweets
    @poem_box = options.poem_box

  render: =>
    $(@el).html @template
    @render_items @tweets
    this

  render_items: (tweets) =>
    _.each tweets, (tweet) =>
      tweet_view = new Goldengrove.Views.Tweet
        tweet: tweet
        poem_box: @poem_box
      $(@el).append(tweet_view.render().el)
