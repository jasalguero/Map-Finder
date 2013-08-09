MapFinder.MapController = Ember.ObjectController.extend(
	mapContainer: ''
	mapGeocoder: ''

	init: ->
		@_super()
		@set 'mapGeocoder', L.mapbox.geocoder(MapFinder.CONSTANTS.MAP_ID)

	geocode: (location) ->
		@get('mapGeocoder')?.query location, (error, response) =>
			if response?

				#create marker object
				marker = @createMarkerFromResponse(response)

				#save marker

				#focus map
				@get('mapContainer').panTo({"lat":marker.get('lat'),"lng":marker.get('lng')});

				#add marker to map
				# L.mapbox.markerLayer(   
				#     type: 'Feature'
				#     geometry: {
				#         type: 'Point'
				#         coordinates: [marker.get('lng'), marker.get('lat')]
				#     },
				#     properties: {
				#         title: 'Found it!',
				#         description: 'Click on me to see pictures of the place'
				#         'marker-size': 'large'
				#         'marker-color': '#E70707'
				#     }
				# ).addTo(@get('mapContainer'))

			if error?
				console.log error

	createMarkerFromResponse: (response) ->
		marker = MapFinder.Marker.create(
			id: MapFinder.GuidHelper()
			lat: response.latlng?[0]
			lng: response.latlng?[1]
		)
)
