class Phonebooth.Views.PhotosIndex extends Backbone.View
  tagName: 'div'

  events:
    'submit #new_search': 'newSearch'

  template: JST['photos/index']

  initialize: ->
    @collection.on('reset', @render, this)
    # @collection.on('setLatitude', @render, this)
    # @collection.on('setLongitude', @render, this)

  render: ->
    $(@el).html(@template(photos: @collection))
    # console.log @collection.latitude
    latlng = new google.maps.LatLng(@collection.latitude, @collection.longitude)
    # console.log latlng
    options =
      zoom: 15
      center: latlng
      mapTypeId: google.maps.MapTypeId.ROADMAP
    console.log "--------------------"
    console.log "zoom #{options.zoom}"
    console.log "center #{options.center}"
    this.map = new google.maps.Map(document.getElementById("map_canvas"), options)
    this

  newSearch: (event) ->
    event.preventDefault()
    address = $('#new_search_location').val()
    @collection.newSearch(address)
