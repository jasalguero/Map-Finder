MapFinder.ApplicationController = Ember.ObjectController.extend(
	needs: ['map']
	addMarker: ->
		this.get('controllers.map').geocode($('#marker_location').val())
		$('#marker_location').val('')
)
