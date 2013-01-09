class Phonebooth.Collections.Photos extends Backbone.Collection

  initialize: ->
    @client_id = '811435c5b0e24276b778c61d5e3a2925'
    @latitude  = '37.76058'
    @longitude = '-122.426716'

    navigator.geolocation.getCurrentPosition(@setLatitude, =>
      console.log('we dont have geolocation')
      @latitude  = '37.76058'      # Dolores Park Lat
      console.log(@latitude)
      )
    navigator.geolocation.getCurrentPosition(@setLongitude, =>
      console.log('we dont have geolocation')
      @longitude = '-122.426716'   # Dolores Park Lng
      console.log(@longitude)
      )
        
  url: ->
    "https://api.instagram.com/v1/media/search?lat=#{@latitude}&lng=#{@longitude}&client_id=#{@client_id}&count=100&callback=?"
  # todo: reassess whether the above is the best endpoint to use
  # url: 'https://api.instagram.com/v1/media/search?lat=37.76058&lng=-122.426716&client_id=811435c5b0e24276b778c61d5e3a2925&callback=?'
  # url: "https://api.instagram.com/v1/locations/search?lat=37.76058&lng=-122.426716&client_id=811435c5b0e24276b778c61d5e3a2925&callback=?"

  parse: (response) ->
    @nextUrl = response.pagination
    console.log @nextUrl
    response.data
  
  model: Phonebooth.Models.Photo

  setLatitude: (position) =>
    @latitude = position.coords.latitude

  setLongitude: (position) =>
    @longitude = position.coords.longitude
    @fetch()

  # todo: refactor setCoords, Setlong, setLat into one function
  # that expects a clean parameter

  setCoords: (coords) =>
    @latitude  = coords.Ya
    @longitude = coords.Za
    @fetch() 
  # todo: Bind events properly so model will sync
  # without hard coded fetches

  newSearch: (address) ->
    geocoder = new google.maps.Geocoder()
    geocoder.geocode(
      'address': address, 
      (results, status) => 
        if status is google.maps.GeocoderStatus.OK
          @setCoords(results[0].geometry.location)
        else alert "Geocoding failed: " + status
    )
  




