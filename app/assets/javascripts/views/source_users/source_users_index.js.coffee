class Goldengrove.Views.SourceUsersIndex extends Backbone.View

  template: HandlebarsTemplates['source_users/index']

  initialize: (options) =>
    @poems_new_view = options.poems_new_view
    @users = {}
    @collection = new Goldengrove.Collections.SourceUsers()
    @collection.on('reset', @render)
    # todoxxx do not like
    @collection.fetch
      reset: true

  render: =>
    @collection.each (source_user) =>
      su_view = new Goldengrove.Views.SourceUser
        model: source_user
        poems_new_view: @poems_new_view
      $(@el).append(su_view.render().el)
    this
