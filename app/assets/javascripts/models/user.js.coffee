class Goldengrove.Models.User extends Backbone.Model

  urlRoot: '/users'

  parse: (response) ->
    poems = _.map response.poems, (poem) =>
      poem = new Goldengrove.Models.Poem(poem)
      poem.set('user', @)
    response.poems = new Goldengrove.Collections.Poems(poems)

    titles = _.map response.titles, (title) ->
      new Goldengrove.Models.Title(title)
    response.titles = new Goldengrove.Collections.Titles(titles)

    response
