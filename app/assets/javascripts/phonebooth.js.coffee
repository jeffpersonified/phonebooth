window.Phonebooth =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: -> 
    window.router = new Phonebooth.Routers.Photos()
    Backbone.history.start()

$(document).ready ->
  Phonebooth.initialize()
