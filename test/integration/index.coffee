describe "Index page", ->

  it"returns HTML", ->
   visit("/").then ->
     ok exists("*"), "Found HTML!"

  it "displays the header", ->
    visit('/').then ->
      find('h4').text().should.equal 'Map Locator for folks at WayMate'
