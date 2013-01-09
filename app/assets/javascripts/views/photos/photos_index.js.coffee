class Phonebooth.Views.PhotosIndex extends Backbone.View
  tagName: 'div'

  events:
    'submit #new_search' : 'newSearch'
    
  template: JST['photos/index']

  initialize: ->
    @collection.on('reset', @render, this)

  render: ->
    $(@el).html(@template(photos: @collection))
    console.log @collection.models[0]

    latlng = new google.maps.LatLng(@collection.latitude, @collection.longitude)
    console.log latlng

    options =
      zoom: 15
      center: new google.maps.LatLng(@collection.latitude + 0.0007577, @collection.longitude + 0.0136653)
      mapTypeId: google.maps.MapTypeId.ROADMAP
      # console.log center

    this.map = new google.maps.Map(document.getElementById("map_canvas"), options)
    
    this.setMarkers = for photo in @collection.models
      markerInfo = 
        position: new google.maps.LatLng(photo.get('location').latitude, photo.get('location').longitude)
        map: this.map
        title: "hello world"  # markerInfo.title || ''
        zIndex: 1             # needs to iterate

      marker = new google.maps.Marker markerInfo
    this

  newSearch: (event) ->
    event.preventDefault()
    address = $('#new_search_location').val()
    @collection.newSearch(address)

