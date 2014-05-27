class Goldengrove.Views.PoemsNew extends Backbone.View

  template: HandlebarsTemplates['poems/new']

  events:
    'click #src-search-button': 'get_tweet_list_from_search'

  render: =>
    $(@el).html @template
    su_index = new Goldengrove.Views.SourceUsersIndex
      poems_new_view: this
    # @$('#random-box').append(su_index.el)
    this

  get_tweet_list: (screen_name) =>
    # xxx ajax call to server to retrieve user tweets
    $.ajax
      url: '/source_users/get_tweets'
      type: 'GET'
      dataType: 'json'
      data:
        screen_name: screen_name
      complete: (data) =>
        @render_writing_view(data.responseJSON)

  # xxx refac
  # submit event?
  get_tweet_list_from_search: =>
    screen_name = $('#src-search').val()
    @get_tweet_list(screen_name)

  render_writing_view: (tweets) =>
    view = new Goldengrove.Views.PoemsWrite(tweets)
    $('#poem-container').html(view.render().el)
