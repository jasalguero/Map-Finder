#Global controller for the application handling the main form submission
MapFinder.ApplicationController = Ember.ObjectController.extend(
	needs: ['map']

	###
		FUNCTIONS THAT DO THE REAL STUFF
	###
	
	addMarker: ->
		input = $('#marker_location')
		if !Ember.isEmpty input.val()
			@get('controllers.map').doGeocode($('#marker_location').val())
			$('#marker_location').val('')
		else
			MapFinder.showError("I need something, anything to search!")

	centerMarker: (marker) ->
		@get('controllers.map').focusMap(marker)
)
