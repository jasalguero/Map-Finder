###
	Generates a GUID string, according to RFC4122 standards.
	@returns {String} The generated GUID.
	@example af8a8416-6e18-a307-bd9c-f2c947bbb3aa
	@author Slavik Meltser (slavik@meltser.info).
	@link http://slavik.meltser.info/?p=142
###
MapFinder.GuidHelper= ->
  _p8 = (s) ->
    p = (Math.random().toString(16) + "000000000").substr(2, 8)
    (if s then "-" + p.substr(0, 4) + "-" + p.substr(4, 4) else p)
  _p8() + _p8(true) + _p8(true) + _p8()

MapFinder.ShowError= ->
	MapFinder.ToggleMsg($('#errorMsg'))

MapFinder.ShowSuccess= ->
	MapFinder.ToggleMsg($('#successMsg'))

# Show some of the notification messages and set a timeout for its fading
MapFinder.ToggleMsg = (message) ->
	message.fadeIn(600, ->
		setTimeout(->
			message.fadeOut(600)
		,2000)
	)

# Retrieve photos from Panoramio based on a marker's position, there's no error handling because of the jsonp technique
MapFinder.GetPhotosByLocation = (marker) ->
	debugger
	$.ajax( MapFinder.CONSTANTS.PANORAMIO_URL,
		type: 'GET'
		crossDomain: true
		contentType: 'jsonp'
		dataType: 'jsonp'
		data:
			set:'public'
			from: 0
			to: 10
			size: 'medium'
			mapfilter: false
			minx: marker.lng - 0.005
			miny: marker.lat - 0.005
			maxx: marker.lng + 0.005
			maxy: marker.lat + 0.005
	).then( (data) ->
		console.log data
		results = []
		data.photos?.forEach( (photo) ->
			data = 
				'url': photo.photo_file_url
				'title': photo.photo_title
			results.push(data)
		)
		results
	)

# Shows a clean modal
MapFinder.ShowModal = ->
	$('#carousel-items').html('')
	$('#myModal').modal()

MapFinder.AddPhotosToModal = (photos) ->
	if (Ember.isArray photos)  && !(Ember.isEmpty photos)
		carousel = $('#carousel-items')
		photos.forEach( (photo) ->
			console.log(photo)
			item = $("<div class='item'><img src=" + photo.url + " alt=''><div class='carousel-caption'><h4>" + photo.title + "</h4></div>");
			carousel.prepend(item)
		)

		#reactivate the carousel plugin
		$('.carousel').carousel()

MapFinder.moveSlide = (direction) ->
	$slideshow = $(".slideshow")
	totalSlides = $slideshow.children().length
	if direction is "prev"
		$newSlide = $slideshow.find(".active").prev()
		$newSlide = $(".image").last()  if $newSlide.index() < 0
	else
		$newSlide = $slideshow.find(".active").next()
		$newSlide = $(".image").first()  if $newSlide.index() < 0
		$slideshow.find(".active").removeClass("active").hide()
		$newSlide.addClass("active").show()
	false
