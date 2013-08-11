#Boring Ember stuff here, just wiring things
MapFinder = window.MapFinder = Ember.Application.create()

MapFinder.CONSTANTS =
	MAP_ID: 'jasalguero.map-aft8k4er'
	MAP_INIT: 
		LAT: 52.5298943
		LNG: 13.403134300000033

# Order and include as you please.
require('scripts/routes/*')
require('scripts/controllers/*')
require('scripts/models/*')
require('scripts/views/*')
require('scripts/helpers/*')


MapFinder.Router.map( -> 
 this.resource('map', { path: '/' })
)
