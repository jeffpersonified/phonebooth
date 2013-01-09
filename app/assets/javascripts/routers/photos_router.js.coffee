class Phonebooth.Routers.Photos extends Backbone.Router
  routes:
    '': 'index'
    'photos/:id': 'show'

  initialize: ->
    @collection = new Phonebooth.Collections.Photos()
    @collection.fetch()

  index: ->
    view = new Phonebooth.Views.PhotosIndex(collection: @collection)
    $('#container').html(view.render().el)


  show: (id) ->
    alert "Photo #{id}"
  # todo: once backend configured, create url paths for photo 
  # collections, better ux
