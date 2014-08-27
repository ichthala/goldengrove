class Goldengrove.Models.User extends Backbone.Model

  urlRoot: '/users'

  set_poem_collection: =>
    @poems = _.map @attributes.poems, (poem) ->
      new Goldengrove.Models.Poem(poem)
    @poems = new Goldengrove.Collections.Poems(@poems)
    @trigger 'poems_set'
