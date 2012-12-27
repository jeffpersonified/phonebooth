window.Phonebooth =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: -> 
    new Phonebooth.Routers.Photos()
    Backbone.history.start()

$(document).ready ->
  Phonebooth.initialize()
