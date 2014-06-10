class Goldengrove.Views.PoemsIndex extends Backbone.View

  template: HandlebarsTemplates['poems/index']

  render: =>
    $(@el).html @template
    console.log 'render'
    $.ajax
      url: '/poems'
      type: 'GET'
      dataType: 'json'
      success: (data) =>
        console.log data
        $(@el).html @template
