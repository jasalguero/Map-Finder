#Controller that handles everything related to the map
MapFinder.MapController = Ember.ObjectController.extend(
	###
		VARIABLES
	###
	mapContainer: ''
	mapGeocoder: ''

	needs: ['application']

	###
		INTERNAL FUNCTIONS
	###
	init: ->
		@_super()
		@set 'mapGeocoder', new google.maps.Geocoder()

	###
		FUNCTIONS THAT DO THE REAL STUFF
	###
	doGeocode: (location) ->
		#make sure the geocoder is there
		if @mapGeocoder?

			@mapGeocoder.geocode(address: location, (data) =>
					if data?
						console.log data
						@get('controllers.application').showSuccess()

						marker = @createMarkerFromResponse(data)

						@focusMap(marker)

						@addMarkerToMap(marker)		
				)
		#nothing can be done, just notify the user
		else
			@get('controllers.application').showError()


	###
		UTILITY FUNCTIONS
	###

	initialiseMap: ->
		@set('mapContainer',L.mapbox.map('map', MapFinder.CONSTANTS.MAP_ID)
			.setView([MapFinder.CONSTANTS.MAP_INIT.LAT, MapFinder.CONSTANTS.MAP_INIT.LNG], 14))

	#Create a marker from the Google Maps response
	createMarkerFromResponse: (response) ->
		#just care for the first result returned
		latlong = response[0]?.geometry?.location

		marker = MapFinder.Marker.create(
			id: MapFinder.GuidHelper()
			lat: latlong.lb
			lng: latlong.mb
		)

	#Add a marker to the existing map
	addMarkerToMap: (marker) ->
		if @mapContainer?
			L.mapbox.markerLayer(   
			    type: 'Feature'
			    geometry: {
			        type: 'Point'
			        coordinates: [marker.get('lng'), marker.get('lat')]
			    },
			    properties: {
			        title: 'Found it!',
			        description: 'Click on me to see pictures of the place'
			        'marker-size': 'large'
			        'marker-color': '#E70707'
			    }
			)
			.addTo(@mapContainer)
			.on 'click', @handlePinClicked

	handlePinClicked: (e) ->
		console.log 'hey'

	#Center the markers location
	focusMap: (marker) ->
		@mapContainer.panTo({"lat":marker.get('lat'),"lng":marker.get('lng')});

)
