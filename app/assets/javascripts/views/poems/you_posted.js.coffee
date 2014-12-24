class Goldengrove.Views.YouPosted extends Backbone.View

  template: HandlebarsTemplates['poems/you_posted']

  initialize: (options) =>
    @shared = options.shared

  render: =>
    console.log 'TITLES:'
    console.log @collection
    $(@el).html @template this
    @collection.each (title) =>
      console.log 'a title'
      title_view = new Goldengrove.Views.Title
        model: title
      @$('#titles-earned').append(title_view.render().el)
    this
