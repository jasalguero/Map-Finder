MapFinder.MapView = Ember.View.extend(
  templateName: 'map'
  didInsertElement: ->
  	this.set('controller.mapContainer',L.mapbox.map('map', MapFinder.CONSTANTS.MAP_ID).setView([37.9, -77], 9))
)