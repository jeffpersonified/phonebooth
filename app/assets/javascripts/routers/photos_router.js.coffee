class Phonebooth.Routers.Photos extends Backbone.Router
  routes:
    '': 'index'
    'photos/:id': 'show'

  initialize: ->
    # put geolocation code here???
    @collection = new Phonebooth.Collections.Photos()
    console.log @collection.latitude
    @collection.fetch()
    console.log @collection.latitude

  index: ->
    view = new Phonebooth.Views.PhotosIndex(collection: @collection)
    $('#container').html(view.render().el)

  show: (id) ->
    alert "Photo #{id}"