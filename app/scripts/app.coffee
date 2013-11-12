#Boring Ember stuff here, just wiring things
MapFinder = window.MapFinder = Ember.Application.create()

MapFinder.CONSTANTS =
	MAPBOX_ID: 'jasalguero.map-aft8k4er'
	MAP_INIT: 
		LAT: 52.5298943
		LNG: 13.403134300000033
	PANORAMIO_URL: 	"http://www.panoramio.com/map/get_panoramas.php?set=public&from=0&to10&size=medium&mapfilter=true"


# Order and include as you please.
require('scripts/routes/*')
require('scripts/controllers/*')
require('scripts/models/*')
require('scripts/views/*')
require('scripts/helpers/*')


MapFinder.Router.map( -> 
 this.resource('map', { path: '/' })
)
