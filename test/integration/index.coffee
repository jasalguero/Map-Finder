describe "Index page", ->
  it "displays the header", ->
    visit('/').then ->
      find('h4').text().should.equal 'Map Locator for folks at WayMate'
