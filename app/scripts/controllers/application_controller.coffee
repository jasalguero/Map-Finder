#Global controller for the application handling the main form submission
MapFinder.ApplicationController = Ember.ObjectController.extend(
	needs: ['map']

	###
		FUNCTIONS THAT DO THE REAL STUFF
	###
	
	addMarker: ->
		this.get('controllers.map').doGeocode($('#marker_location').val())
		$('#marker_location').val('')
)
