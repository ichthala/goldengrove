class Goldengrove.Views.PoemsWrite extends Backbone.View

  template: HandlebarsTemplates['poems/write']

  className: 'row'

  initialize: (tweets) =>
    @tweets = tweets

  render: =>
    $(@el).html @template
    # xxx find a better way
    poem_box = new Goldengrove.Views.PoemBox()
    $(@el).append(poem_box.render().el)
    tweet_box = new Goldengrove.Views.TweetBox
      tweets: @tweets
      poem_box: poem_box
    $(@el).prepend(tweet_box.render().el)
    this
