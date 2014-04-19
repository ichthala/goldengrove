class Goldengrove.Views.SourceUser extends Backbone.View

  template: HandlebarsTemplates['source_users/show']

  initialize: (source_user) =>
    console.log source_user
    @source_user = source_user

  render: =>
    $(@el).html @template @source_user
    this


