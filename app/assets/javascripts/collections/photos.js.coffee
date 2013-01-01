class Phonebooth.Collections.Photos extends Backbone.Collection
  # lat:  37.76058    # Dolores Park Latitude
  # lng: -122.426716  # Dolores Park Longitude
  # client_id: "811435c5b0e24276b778c61d5e3a2925"

  # initialize: ->
  #   lat = 37.76058
  #   lng = -122.426716
  #   locationSearch(lat, lng)

  # url: function() {
  #   return "https://api.instagram.com/v1/users/self/feed?access_token=" + this.access_token
  # },

  url: 'https://api.instagram.com/v1/media/search?lat=37.76058&lng=-122.426716&client_id=811435c5b0e24276b778c61d5e3a2925&callback=?'

  # url: "https://api.instagram.com/v1/locations/search?lat=37.76058&lng=-122.426716&client_id=811435c5b0e24276b778c61d5e3a2925&callback=?"

  parse: (response) ->
    response.data
  
  model: Phonebooth.Models.Photo



  # locationSearch: (lat, lng) ->


# gets location information
# https://api.instagram.com/v1/locations/search?lat=37.76058&lng=-122.426716&client_id=811435c5b0e24276b778c61d5e3a2925