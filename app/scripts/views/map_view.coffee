#View for the map, call for the map initialisation when the elements are painted
MapFinder.MapView = Ember.View.extend(
  templateName: 'map'

  didInsertElement: ->
  	@get('controller').initialiseMap()
)
