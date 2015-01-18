class Goldengrove.Models.User extends Backbone.Model

  urlRoot: '/users'

  parse: (response) ->
    poems = _.map response.poems, (poem) ->
      new Goldengrove.Models.Poem(poem)
    response.poems = new Goldengrove.Collections.Poems(poems)

    titles = _.map response.titles, (title) ->
      new Goldengrove.Models.Title(title)
    response.titles = new Goldengrove.Collections.Titles(titles)

    response
