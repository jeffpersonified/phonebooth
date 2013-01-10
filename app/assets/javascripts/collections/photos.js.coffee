class Phonebooth.Collections.Photos extends Backbone.Collection

  initialize: ->
    @client_id = '811435c5b0e24276b778c61d5e3a2925'
    @latitude  = '37.76058'        # Default to Dolores Park Lat
    @longitude = '-122.426716'     # Default to Dolores Park Lng

    navigator.geolocation.getCurrentPosition(@setLatitude, =>
      @latitude  = '37.76058'      # If denied, reset to Dolores Park Lat
      )
    navigator.geolocation.getCurrentPosition(@setLongitude, =>
      @longitude = '-122.426716'   # If denied, reset to Dolores Park Lng
      )
        
  url: ->
    "https://api.instagram.com/v1/media/search?lat=#{@latitude}&lng=#{@longitude}&client_id=#{@client_id}&count=100&callback=?"

  parse: (response) ->
    response.data
  
  model: Phonebooth.Models.Photo

  setLatitude: (position) =>
    @latitude = position.coords.latitude

  setLongitude: (position) =>
    @longitude = position.coords.longitude
    @fetch()

  setCoords: (coords) =>
    @latitude  = coords.Ya
    @longitude = coords.Za
    @fetch() 

  newSearch: (address) ->
    geocoder = new google.maps.Geocoder()
    geocoder.geocode(
      'address': address, 
      (results, status) => 
        if status is google.maps.GeocoderStatus.OK
          @setCoords(results[0].geometry.location)
        else alert "Geocoding failed: " + status
    )
  




