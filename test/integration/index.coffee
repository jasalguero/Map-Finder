###require([''])###
describe "Index page", ->
  it "displays the header", ->
    visit('/').then ->
      find('h4').text().should.equal 'Map Locator for folks at WayMate'

###describe "MapRoute", ->
  describe "model property", ->
    indexRoute = MapFinder.MapRoute.create()

    it "should have the right number of items", ->
      model = indexRoute.model()
      model.should.have.length 3###
