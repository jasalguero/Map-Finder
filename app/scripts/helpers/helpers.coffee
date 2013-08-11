###
	Generates a GUID string, according to RFC4122 standards.
	@returns {String} The generated GUID.
	@example af8a8416-6e18-a307-bd9c-f2c947bbb3aa
	@author Slavik Meltser (slavik@meltser.info).
	@link http://slavik.meltser.info/?p=142
###
MapFinder.createGUID = ->
  _p8 = (s) ->
    p = (Math.random().toString(16) + "000000000").substr(2, 8)
    (if s then "-" + p.substr(0, 4) + "-" + p.substr(4, 4) else p)
  _p8() + _p8(true) + _p8(true) + _p8()

MapFinder.showError = (msg) ->
	MapFinder.toggleMsg($('#errorMsg'), msg)

MapFinder.ShowSuccess = (msg) ->
	MapFinder.toggleMsg($('#successMsg'), msg)

# Show some of the notification messages and set a timeout for its fading
MapFinder.toggleMsg = (elem, msg) ->
	elem.children('span').text(msg)
	elem.fadeIn(600, ->
		setTimeout(->
			elem.fadeOut(600)
		,1500)
	)

# Retrieve photos from Panoramio based on a marker's position, there's no error handling because of the jsonp technique
MapFinder.getPhotosByLocation = (marker) ->
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
		results = []
		data.photos?.forEach( (photo) ->
			data = 
				'url': photo.photo_file_url
				'title': photo.photo_title
			results.push(data)
		)
		results
	)

# move map slider forward or backwards
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
