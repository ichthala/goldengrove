class Goldengrove.Views.PoemBox extends Backbone.View

  template: HandlebarsTemplates['poems/poem_box']

  events:
    'click #delete': 'delete_word'
    'click #clear': 'clear_poem'
    'click .punc': 'append_punc'
    'click #poem-submit': 'save_poem'
    'click #poem-share': 'save_and_share'

  render: =>
    $(@el).html @template
    this

  append_word: (word_div) =>
    @$('#blotter').append(word_div)

  delete_word: (e) =>
    console.log 'delete'
    @$('#blotter :last-child').remove()

  append_punc: (e) =>
    punc = $(e.currentTarget).html()
    punc_view = new Goldengrove.Views.TweetWord
      word: punc
    @$('#blotter').append(punc_view.render().el)

  clear_poem: =>
    @$('#blotter').children().remove()

  my_success: (resp) ->
    console.log 'success'

  save_poem: (e) =>
    text = ""
    _.each @$('#blotter').children(), (element) =>
      if $(element).hasClass('punc')
        text = text.trim() + element.innerText + ' '
      else
        text += element.innerText + ' '
    text = text.trim().split('¬').join('\n')
    poem = new Goldengrove.Models.Poem
      text: text
      source_user: 'source_user'
    poem.save(
      null,
      url: poem.urlRoot
      share: false
      success: (response) =>
        console.log response
      error: (response) =>
        console.log response
    )

  save_and_share: (e) =>
    text = ""
    _.each @$('#blotter').children(), (element) =>
      if $(element).hasClass('punc')
        text = text.trim() + element.innerText + ' '
      else
        text += element.innerText + ' '
    text = text.trim().split('¬').join('\n')
    $.ajax
      url: '/poems'
      type: 'POST'
      data: {
        poem: {
          text: text
          source_user: 'source_user'
        }
        share: true
      }
      dataType: 'html'
      # success: (response) =>
      #   console.log 'saved!'
