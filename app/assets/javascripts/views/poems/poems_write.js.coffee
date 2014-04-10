class Goldengrove.Views.PoemsWrite extends Backbone.View

  template: HandlebarsTemplates['poems/write']

  initialize: (tweets) =>
    @tweets = tweets

  render: =>
    $(@el).html @template
    # xxx find a better way
    poem_box = new Goldengrove.Views.PoemBox()
    $(@el).find('#poem-box').html(poem_box.render().el)
    tweet_box = new Goldengrove.Views.TweetBox
      tweets: @tweets
      poem_box: poem_box
    $(@el).find('#tweet-box').html(tweet_box.render().el)
    this
