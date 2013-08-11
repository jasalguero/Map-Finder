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


###
	Show some of the notification messages and set a timeout for its fading
###
MapFinder.ToggleMsg = (message) ->
	message.fadeIn(600, ->
		setTimeout(->
			message.fadeOut(600)
		,2000)
	)
