class Goldengrove.Views.WelcomeIndex extends Backbone.View

  template: HandlebarsTemplates['welcome/index']

  render: =>
    $(@el).html @template
    this