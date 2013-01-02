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
    geocoder = new google.maps.Geocoder()
    address = $('#new_search_content').val()
    geocoder.geocode(
      'address': address, 
      (results, status) -> 
        if status is google.maps.GeocoderStatus.OK
          @collection.latitude = '42.955152'   # set?
          @collection.longitude = '-85.548816' # set?
          # @.model.createSearch(address, results)
        else alert "Geocoding failed: " + status
    )
    @collection.fetch()

