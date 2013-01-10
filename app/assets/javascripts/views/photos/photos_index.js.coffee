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

    latlng = new google.maps.LatLng(@collection.latitude, @collection.longitude)
    shiftLatLng = new google.maps.LatLng(
      parseFloat(@collection.latitude) + 0.0007577, 
      parseFloat(@collection.longitude) + 0.0136653)

    options =
      zoom: 15
      center: shiftLatLng
      mapTypeId: google.maps.MapTypeId.ROADMAP
      disableDefaultUI: true
      zoomControl: true
      zoomControlOptions: 
        position: google.maps.ControlPosition.LEFT_CENTER

    console.log(options.center)
    @map = new google.maps.Map(document.getElementById("map_canvas"), options)
    # @collection.models.indexOf(photo) + 1 
    
    @setMarkers = for photo in @collection.models
      caption = photo.get('caption') || text: "No caption" 
      size = 40                                 # icon size in px
      image = new google.maps.MarkerImage( 
        photo.get('images').thumbnail.url,      # photo url
        new google.maps.Size(size, size),       # size 
        new google.maps.Point(0,0),             # origin point
        new google.maps.Point(0,0),             # anchor point
        new google.maps.Size(size, size)        # scaled size
        )

      console.log photo
      markerInfo = 
        position: new google.maps.LatLng(photo.get('location').latitude, photo.get('location').longitude)
        map: @map
        title: caption.text
        icon: image
        zIndex: 1
        # todo: add click events for markers

      marker = new google.maps.Marker markerInfo
    this

  newSearch: (event) ->
    event.preventDefault()
    address = $('#new_search_location').val()
    @collection.newSearch(address)

