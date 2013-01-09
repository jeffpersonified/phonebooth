class Phonebooth.Views.PhotosIndex extends Backbone.View
  tagName: 'div'

  events:
    'submit #new_search' : 'newSearch'
    
  template: JST['photos/index']

  initialize: ->
    @collection.on('reset', @render, this)
    @collection.on('change', @render, this)

  render: ->
    $(@el).html(@template(photos: @collection))
    # console.log @collection.models[0]

    latlng = new google.maps.LatLng(@collection.latitude, @collection.longitude)
    shiftLatLng = new google.maps.LatLng(
      parseFloat(@collection.latitude) + 0.0007577, 
      parseFloat(@collection.longitude) + 0.0136653)
    console.log "old latlng #{latlng}"
    console.log "changinh lat #{parseFloat(@collection.latitude) + 0.0007577}"
    console.log "This is the new latlng #{shiftLatLng}"

    options =
      zoom: 15
      # not working
      # center: new google.maps.LatLng(@collection.latitude + 0.0007577, @collection.longitude + 0.0136653)
      center: shiftLatLng
      mapTypeId: google.maps.MapTypeId.ROADMAP
      # move tools
    console.log(options.center)
    @map = new google.maps.Map(document.getElementById("map_canvas"), options)
    
    @setMarkers = for photo in @collection.models
      markerInfo = 
        position: new google.maps.LatLng(photo.get('location').latitude, photo.get('location').longitude)
        map: @map
        title: "hello world"  # markerInfo.title || ''
        zIndex: 1             # needs to iterate
        #set markers with better images

      marker = new google.maps.Marker markerInfo
    this

  newSearch: (event) ->
    event.preventDefault()
    address = $('#new_search_location').val()
    @collection.newSearch(address)

