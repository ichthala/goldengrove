class Goldengrove.Views.TweetBox extends Backbone.View

  template: HandlebarsTemplates['poems/tweet_box']

  id: 'tweet-box'
  className: 'large-6 columns'

  initialize: (options) ->
    @tweets = options.tweets
    @poem_box = options.poem_box
    @source_user = @tweets[0].user

  render: =>
    $(@el).html @template @source_user
    @render_items @tweets
    this

  render_items: (tweets) =>
    _.each tweets, (tweet) =>
      tweet_view = new Goldengrove.Views.Tweet
        tweet: tweet
        poem_box: @poem_box
      @$('#inner-tweet-box').append(tweet_view.render().el)
