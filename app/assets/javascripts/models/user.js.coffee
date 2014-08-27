class Goldengrove.Models.User extends Backbone.Model

  urlRoot: '/users'

  set_poem_collection: =>
    _.map @poems, (poem) ->
      new Goldengrove.Models.Poem(poem)
    @poems = Goldengrove.Collections.Poems(@poems)
    trigger 'poems_set'
