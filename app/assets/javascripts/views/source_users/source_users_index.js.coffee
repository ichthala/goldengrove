class Goldengrove.Views.SourceUsersIndex extends Backbone.View

  template: HandlebarsTemplates['source_users/index']

  events:
    'click #repopulate-button' : 'repopulate_source_users'

  initialize: (options) =>
    @poems_new_view = options.poems_new_view
    @users = {}
    @collection = new Goldengrove.Collections.SourceUsers()
    @collection.on('reset', @render)
    # todoxxx do not like
    @collection.fetch
      reset: true

  repopulate_source_users: =>
    @collection.fetch
      reset: true
      complete: ->
        console.log 'done'

  render: =>
    $(@el).empty()
    @collection.each (source_user) =>
      su_view = new Goldengrove.Views.SourceUser
        model: source_user
        poems_new_view: @poems_new_view
      $(@el).append(su_view.render().el)
    this
