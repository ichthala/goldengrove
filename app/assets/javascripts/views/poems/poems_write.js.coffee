class Goldengrove.Views.PoemsWrite extends Backbone.View

  template: HandlebarsTemplates['poems/write']

  initialize: (tweets) =>
    @tweets = tweets

  render: =>
    console.log 'write render'
    $(@el).html @template
    # xxx find a better way
    tweet_box = new Goldengrove.Views.TweetBox(@tweets)
    $(@el).find('#tweet-box').html(tweet_box.render().el)
    poem_box = new Goldengrove.Views.PoemBox()
    $(@el).find('#poem-box').html(poem_box.render().el)
    this
