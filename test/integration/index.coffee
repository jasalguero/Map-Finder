#TODO: Add Sinon to stub the ajax calls
describe "Index page", ->
  afterEach ->
    #MapFinder.reset()

  it "displays the header", ->
    visit('/').then ->
      find('h4').text().should.equal 'Map Locator for folks at WayMate', "Header should display the form"
      
  it "shows the form", ->
    visit('/').then ->
      find('#createMarkerForm').should.exist

  it "empty submit should not create a marker", ->
  	visit('/').then ->
      click('#submitMarker').then ->
	     find('.leaflet-marker-icon').length.should.equal 0, "The map should have no markers"

  it "should add a new marker", ->
  	visit('/').then ->
  		fillIn('#marker_location','Berlin')
	      .click('#submitMarker').then ->
	      	#Ember Test doesn't support ajax calls so far
		     window.setTimeout(->
		     	find('.leaflet-marker-icon').length.should.equal(1, "The map should have one marker ")
		     ,2000)

  it "should display a photo", ->
  	window.setTimeout( ->
  		click('.leaflet-marker-icon').then ->
	        find('.image').length.should.be.above 0
  	,2000)
	      
  	  
  		
  		



   


