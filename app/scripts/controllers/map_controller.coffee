#Controller that handles everything related to the map
MapFinder.MapController = Ember.ObjectController.extend(
	###
		VARIABLES
	###
	mapContainer: ''
	mapGeocoder: ''

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
						MapFinder.ShowSuccess('Found something, click on it to see some pics!')

						marker = @createMarkerFromResponse(data)

						@focusMap(marker)

						MapFinder.getPhotosByLocation(marker).done( (photos) =>
							@addPinToMap(marker, photos)		
						)
				)
		#nothing can be done, just notify the user
		else
			MapFinder.showError('Oops, something went wrong trying to find the place')


	###
		UTILITY FUNCTIONS
	###

	initialiseMap: ->
		@set 'mapContainer', L.mapbox.map('map', MapFinder.CONSTANTS.MAPBOX_ID)
		@get('mapContainer').setView([MapFinder.CONSTANTS.MAP_INIT.LAT, MapFinder.CONSTANTS.MAP_INIT.LNG], 14)
		@createPinPopup()

	#Create a marker from the Google Maps response
	createMarkerFromResponse: (response) ->
		#just care for the first result returned
		latlong = response[0]?.geometry?.location

		marker = MapFinder.Marker.create(
			id: MapFinder.createGUID()
			lat: latlong.lb
			lng: latlong.mb
		)

	#Add a marker to the existing map
	addPinToMap: (marker, photos) ->
		if @mapContainer?
			geoJSON = @mapContainer.markerLayer.getGeoJSON()
			geoJSON.features.push(   
			    @createPin marker, photos
			)
			@mapContainer.markerLayer.setGeoJSON(geoJSON)
			
	createPin: (marker, photos) ->
		{
			type: 'Feature'
			geometry: {
				type: 'Point'
				coordinates: [marker.get('lng'), marker.get('lat')]
			},
			properties: {
				'title': 'Photos'
				'marker-size': 'large'
				'marker-color': '#E70707'
				'images': photos.map (photo) -> [photo.url, photo.title]
			}
		}
	createPinPopup: ->
		# Add custom popup html to each marker
		@mapContainer.markerLayer.on "layeradd", (e) ->
			marker = e.layer
			feature = marker.feature
			images = feature.properties.images
			slideshowContent = ""
			i = 0

			while i < images.length
				img = images[i]
				slideshowContent += "<div class=\"image" + ((if i is 0 then " active" else "")) + "\">" + "<img src=\"" + img[0] + "\" />" + "<div class=\"caption\">" + img[1] + "</div>" + "</div>"
				i++

			# Create custom popup content
			popupContent = "<div id=\"" + feature.properties.id + "\" class=\"popup\">" + "<h2>" + feature.properties.title + "</h2>" + "<div class=\"slideshow\">" + slideshowContent + "</div>" + "<div class=\"cycle\">" + "<a href=\"#\" class=\"prev\" onclick=\"return MapFinder.moveSlide('prev')\">&laquo; Previous</a>" + "<a href=\"#\" class=\"next\" onclick=\"return MapFinder.moveSlide('next')\">Next &raquo;</a>" + "</div>"
			"</div>"

			# http://leafletjs.com/reference.html#popup
			marker.bindPopup popupContent,
				closeButton: false
				minWidth: 320

	#Center the markers location
	focusMap: (marker) ->
		@mapContainer.panTo({"lat":marker.get('lat'),"lng":marker.get('lng')});

)
