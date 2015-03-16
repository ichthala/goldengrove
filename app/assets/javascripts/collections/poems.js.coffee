class Goldengrove.Collections.Poems extends Backbone.Collection

  url: '/poems'

  model: Goldengrove.Models.Poem

  parse: (response) ->
    # TODO: refac
    _.map response, (poem_json) ->
      user = new Goldengrove.Models.User(poem_json.user)
      delete poem_json.user
      poem = new Goldengrove.Models.Poem(poem_json)
      poem.set('user', user)
      poem
