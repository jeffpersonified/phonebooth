class Phonebooth.Routers.Photos extends Backbone.Router
  routes:
    '': 'index'
    'photos/:id': 'show'

  index: ->
    view = new Phonebooth.Views.PhotosIndex()
    $('#container').html(view.render().el)

  show: (id) ->
    alert "Photo #{id}"