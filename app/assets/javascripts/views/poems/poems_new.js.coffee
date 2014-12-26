class Goldengrove.Views.PoemsNew extends Backbone.View

  template: HandlebarsTemplates['poems/new']

  events:
    'click #src-search-button' : 'get_tweet_list_from_search'
    'click #repopulate-button' : 'repopulate_source_users'

  render: =>
    $(@el).html @template
    @su_index = new Goldengrove.Views.SourceUsersIndex
      poems_new_view: this
    @$('#random-box').append(@su_index.el)
    this

  # xxx refactor duplicated code
  get_tweet_list_from_model: (source_user) =>
    screen_name = source_user.get('screen_name')
    $.ajax
      url: '/source_users/get_tweets'
      type: 'GET'
      dataType: 'json'
      data:
        screen_name: screen_name
      complete: (data) =>
        Goldengrove.current_source_user = source_user
        @render_writing_view(data.responseJSON)

  get_tweet_list_from_screen_name: (screen_name) =>
    $.ajax
      url: '/source_users/get_tweets'
      type: 'GET'
      dataType: 'json'
      data:
        screen_name: screen_name
      complete: (data) =>
        # xxx hate, refac
        # get rid of Goldengrove-level variable
        # find a cleaner way to pull user data from tweets response
        source_user_data = data.responseJSON[0].user
        Goldengrove.current_source_user = new Goldengrove.Models.SourceUser(source_user_data)
        @render_writing_view(data.responseJSON)

  # xxx refac
  # submit event?
  get_tweet_list_from_search: =>
    screen_name = $('#src-search').val()
    @get_tweet_list_from_screen_name(screen_name)

  repopulate_source_users: =>
    @su_index.repopulate_source_users()

  render_writing_view: (tweets) =>
    view = new Goldengrove.Views.PoemsWrite(tweets)
    $('#poem-container').html(view.render().el)
