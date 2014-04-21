class Goldengrove.Views.YouPosted extends Backbone.View

  template: HandlebarsTemplates['poems/you_posted']

  initialize: (options) =>
    @titles = options.titles
    @shared = options.shared

  render: =>
    $(@el).html @template this
    _.each @titles, (title) =>
      title_view = new Goldengrove.Views.Title
        title: title
      @$('#titles-earned').append(title_view.render().el)
    this
