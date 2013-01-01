class Phonebooth.Collections.Photos extends Backbone.Collection
  # 0) finish rails cast
  # 1) create variables for lat,lng,client_id
  # 2) get location from navigator
  # 3) create logic for search
  # 4) pagination

  # initialize: ->
  #   lat = 37.76058
  #   lng = -122.426716
  #   locationSearch(lat, lng)

  url: ->
    @getURL()
    # could just put url function directly here:
    # "https://api.instagram.com/v1/media/search?lat=#{@latitude}&lng=#{@longitude}&client_id=#{@client_id}&callback=?"

  # url: 'https://api.instagram.com/v1/media/search?lat=37.76058&lng=-122.426716&client_id=811435c5b0e24276b778c61d5e3a2925&callback=?'

  # url: "https://api.instagram.com/v1/locations/search?lat=37.76058&lng=-122.426716&client_id=811435c5b0e24276b778c61d5e3a2925&callback=?"

  parse: (response) ->
    response.data
  
  model: Phonebooth.Models.Photo

  latitude: '37.76058'

  longitude: '-122.426716'

  client_id: '811435c5b0e24276b778c61d5e3a2925'

  getURL: ->
    "https://api.instagram.com/v1/media/search?lat=#{@latitude}&lng=#{@longitude}&client_id=#{@client_id}&callback=?"
    # 'https://api.instagram.com/v1/media/search?lat=37.76058&lng=-122.426716&client_id=811435c5b0e24276b778c61d5e3a2925&callback=?'
  


  # getLatitude: ->
  #   '37.76058'


  # locationSearch: (lat, lng) ->

  # lat:  37.76058    # Dolores Park Latitude
  # lng: -122.426716  # Dolores Park Longitude
  # client_id: "811435c5b0e24276b778c61d5e3a2925"