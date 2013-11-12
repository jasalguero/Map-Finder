expect = chai.expect
assert = chai.assert
should = chai.should()

chai.Assertion.includeStack = true

Ember.testing = true

document.write('<div id="ember-testing-container"><div id="ember-testing"></div></div>');
document.write('<style>#ember-testing-container { position: absolute; background: white; bottom: 0; right: 0; width: 100%; height: 100%; overflow: auto; z-index: 9999; border: 5px solid #ccc; } #ember-testing { zoom: 80%; }</style>');



MapFinder.rootElement = "#ember-testing"
Ember.Test.adapter = Ember.Test.MochaAdapter.create()

#need to tell mocha not to control the libraries leaks
mocha.setup globals: ["_leaflet_resize3","_xdc_"]

MapFinder.setupForTesting()
MapFinder.injectTestHelpers()
Ember.run(MapFinder, MapFinder.advanceReadiness)

window.start = ->
window.stop = ->

