class Goldengrove.Views.SourceUser extends Backbone.View

  template: HandlebarsTemplates['source_users/show']

  className: 'source-user'

  events:
    'click .source-user-select' : 'get_tweet_list'

  initialize: (options) =>
    @poems_new_view = options.poems_new_view

  render: =>
    $(@el).html @template @model.toJSON()
    this

  get_tweet_list: =>
    # xxx refac
    @poems_new_view.get_tweet_list_from_model(@model)
