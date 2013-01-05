class Phonebooth.Views.PhotosIndex extends Backbone.View
  tagName: 'div'

  events:
    'submit #new_search': 'newSearch'

  template: JST['photos/index']

  initialize: ->
    @collection.on('reset', @render, this)

  render: ->
    $(@el).html(@template(photos: @collection))
    latlng = new google.maps.LatLng(@collection.latitude, @collection.longitude)

    options =
      zoom: 13
      center: latlng
      mapTypeId: google.maps.MapTypeId.ROADMAP

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

