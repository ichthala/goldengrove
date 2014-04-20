class Goldengrove.Views.SourceUser extends Backbone.View

  template: HandlebarsTemplates['source_users/show']

  className: 'source-user'

  events:
    'click': 'get_tweet_list'

  initialize: (options) =>
    @source_user = options.user
    @poems_new_view = options.poems_new_view

  render: =>
    $(@el).html @template @source_user
    this

  get_tweet_list: =>
    # xxx refac
    @poems_new_view.get_tweet_list(@source_user.screen_name)
