class Goldengrove.Views.TweetBox extends Backbone.View

  template: HandlebarsTemplates['poems/tweet_box']

  initialize: (tweets) ->
    @tweets = tweets

  render: =>
    console.log 'tweet box render'
    $(@el).html @template
    @render_items @tweets
    this

  render_items: (tweets) =>
    _.each tweets, (tweet) =>
      tweet_view = new Goldengrove.Views.Tweet(tweet)
      $(@el).append(tweet_view.render().el)
