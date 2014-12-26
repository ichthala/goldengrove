class Goldengrove.Views.PoemBox extends Backbone.View

  template: HandlebarsTemplates['poems/poem_box']

  id: 'poem-box'
  className: 'large-6 columns'

  events:
    'click #delete': 'delete_word'
    'click #clear': 'clear_poem'
    'click #newline': 'newline'
    'click .punc': 'append_punc'
    'click #poem-submit': 'save_poem'
    'click #poem-share': 'save_and_share'

  render: =>
    $(@el).html @template
    this

  append_word: (word_div) =>
    @$('#blotter').append(word_div)

  delete_word: (e) =>
    @$('#blotter :last-child').remove()

  append_punc: (e) =>
    punc = $(e.currentTarget).html()
    punc_view = new Goldengrove.Views.TweetWord
      word: punc
    @$('#blotter').append(punc_view.render().el)

  newline: (e) =>
    @$('#blotter').append('')

  clear_poem: =>
    @$('#blotter').children().remove()

  # xxx combine save_poem and save_and_share into one
  save_poem: (e) =>
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
      dataType: 'json'
      data:
        poem:
          text: text
          source_user: Goldengrove.current_source_user.get('screen_name')
        share: false
      complete: (data) =>
        @render_you_posted
          collection: new Goldengrove.Collections.Titles(data.responseJSON)
          shared: false

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
      dataType: 'json'
      data:
        poem:
          text: text
          source_user: Goldengrove.current_source_user.get('screen_name')
        share: true
      complete: (data) =>
        titles = data.responseJSON
        @render_you_posted
          collection: new Goldengrove.Collections.Titles(titles)
          shared: true

  render_you_posted: (options) =>
    view = new Goldengrove.Views.YouPosted(options)
    $('#poem-container').html(view.render().el)
