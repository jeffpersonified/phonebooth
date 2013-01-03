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
    address = $('#new_search_location').val()
    @collection.newSearch(address)

  # renderMap: ->
  #   console.log "made it into renderMap"
  #   mapOptions = 
  #     center: new google.maps.LatLng(@.latitude, @.longitude)
  #     zoom: 8
  #     mapTypeId: google.maps.MapTypeId.ROADMAP
  #   console.log "made it past setting options"
  #   console.log  document.getElementById("map_canvas")
  #   map = 
  #     new google.maps.Map(document.getElementById("map_canvas"), mapOptions)
  #   # map()
  #   console.log "made it past setting options"
  #   console.log map

