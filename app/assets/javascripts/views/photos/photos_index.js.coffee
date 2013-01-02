class Phonebooth.Views.PhotosIndex extends Backbone.View
  tagName: 'div'

  events:
    'submit #new_search': 'newSearch'

  template: JST['photos/index']

  initialize: ->
    @collection.on('reset', @render, this)
    @collection.on('setLatitude', @render, this)
    @collection.on('setLongitude', @render, this)

  render: ->
    $(@el).html(@template(photos: @collection))
    this

  newSearch: (event) ->
    event.preventDefault()
    @collection.latitude = '42.955152'   # set?
    @collection.longitude = '-85.548816' # set?
    @collection.fetch()



    
    # latitude: '42.955152', longitude: '-85.548816'
    # 42.955152,-85.548816 # 430 Village Springs Dr.
    # @collection.create name: $('#new_entry_name').val()
    # collection should have a location and newSearch 
    # should reset that location and create a new collection