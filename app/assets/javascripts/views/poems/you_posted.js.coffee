class Goldengrove.Views.YouPosted extends Backbone.View

  template: HandlebarsTemplates['poems/you_posted']

  initialize: (options) =>
    @shared = options.shared

  render: =>
    $(@el).html @template this
    @collection.each (title) =>
      title_view = new Goldengrove.Views.Title
        model: title
      @$('#titles-earned').append(title_view.render().el)
    this
