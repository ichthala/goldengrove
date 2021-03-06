class Goldengrove.Views.PoemBox extends Backbone.View

  template: HandlebarsTemplates['poems/poem_box']

  id: 'poem-box'
  className: 'large-6 columns'

  events:
    'click #delete': 'delete_word'
    'click #clear': 'clear_poem'
    'click #newline': 'newline'
    'click .punc': 'append_punc'
    'click #poem-submit': 'poem_submit'
    'click #poem-share': 'poem_submit'

  initialize: (options) =>
    @row_num = 1

  render: =>
    $(@el).html @template
    this

  append_word: (word_div) =>
    @$("#row-#{@row_num}").append(word_div)

  delete_word: (e) =>
    @$('#blotter :last-child').remove()

  append_punc: (e) =>
    punc = $(e.currentTarget).html()
    punc_view = new Goldengrove.Views.TweetWord
      word: punc
      className: 'tweet-word punc'
    @$("#row-#{@row_num}").append(punc_view.render().el)

  newline: (e) =>
    @row_num += 1
    @$('#blotter').append("<div class=\"row\"><div class=\"small-12 columns\" id=\"row-#{@row_num}\"></div></div>")

  clear_poem: =>
    # xxx do not like
    @$('#blotter').children().remove()
    @$('#blotter').append("<div class=\"row\" id=\"row-1\"></div>")

  # todoxxx: convert to promises
  poem_submit: (e) ->
    Goldengrove.helpers.is_user_signed_in(@save_poem, @show_modal)

  show_modal: ->
    $('#show-modal-link').trigger('click');

  # xxx combine save_poem and save_and_share into one
  # also, major refactoring needed
  save_poem: (e) =>
    text = ""
    _.each @$('#blotter').children(), (line) =>
      _.each $(line).find('.tweet-word'), (word) =>
        word = $(word)
        if word.hasClass('punc')
          text = text.trim() + word.text() + ' '
        else
          text += word.text() + ' '
      text = text.trim() + "\n"

    text = text.trim()

    poem = new Goldengrove.Models.Poem(text: text)
    poem.save (data) =>
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
