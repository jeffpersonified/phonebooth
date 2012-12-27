class Phonebooth.Views.PhotosIndex extends Backbone.View

  template: JST['photos/index']

  render: ->
    $(@el).html(@template(photos: "photos go here"))
    this