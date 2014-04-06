class Goldengrove.Views.PoemsNew extends Backbone.View
  events:
    'click #random-box': 'get_tweet_list'
    'submit #src-search': 'get_tweet_list'

  template: HandlebarsTemplates['poems/new']

  render: =>
    console.log 'new render'
    $(@el).html @template
    this

  get_tweet_list: (e) =>
    # xxx ajax call to server to retrieve user tweets
    tweets = [
      "When I think about @sandimetz I always imagine her standing radiant and beatific amidst a horde of bearded men weeping about their compilers",
      "The Eurasian magpie is one of the few animal species that recognizes itself in a mirror test.",
      "Will RT whatever you want for supernatural horror books. Get at me. 8-)"
    ]
    @render_writing_view(tweets)

  render_writing_view: (tweets) =>
    view = new Goldengrove.Views.PoemsWrite(tweets)
    $('#poem-container').html(view.render().el)
