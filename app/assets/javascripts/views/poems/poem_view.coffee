class Goldengrove.Views.PoemView extends Backbone.View

  template: HandlebarsTemplates['poems/poem']

  render: =>
    # todoxxx do not like this — source_user should not have the @ on it
    # that will be fixed when I combine User and SourceUser into one model
    @model.set('plain_source_user', @model.get('source_user').slice(1))
    $(@el).html @template @model.toJSON()
    this
