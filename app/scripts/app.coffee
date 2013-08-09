MapFinder = window.MapFinder = Ember.Application.create()

MapFinder.CONSTANTS =
	MAP_ID: 'jasalguero.map-aft8k4er'

# Order and include as you please.
require('scripts/routes/*')
require('scripts/controllers/*')
require('scripts/models/*')
require('scripts/views/*')
require('scripts/helpers/*')


MapFinder.Router.map( -> 
 this.resource('map', { path: '/' })
)
