class Phonebooth.Views.PhotosIndex extends Backbone.View
  tagName: 'li'

  template: JST['photos/index']

  initialize: ->
    @collection.on('reset', @render, this)

  render: ->
    $(@el).html(@template(photos: @collection))
    this