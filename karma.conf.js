/*jshint undef:false */

// Karma configuration

// base path, that will be used to resolve files and exclude
basePath = '';


// list of files / patterns to load in the browser
files = [
  MOCHA,
  MOCHA_ADAPTER,
  'app/bower_components/jquery/jquery.min.js',
  'app/bower_components/handlebars/handlebars.runtime.js',
  'app/bower_components/ember/ember.js',
  'app/bower_components/ember-data-shim/ember-data.js',
  'test/lib/chai.js',
  'app/bower_components/ember-mocha-adapter/adapter.js',
  '.tmp/scripts/combined-scripts.js',
  '.tmp/scripts/compiled-templates.js',
  'http://api.tiles.mapbox.com/mapbox.js/v1.3.0/mapbox.js',
  'https://maps.googleapis.com/maps/api/js?key=AIzaSyAllvcL7Taop-JvcIooF-kV5OwHQDdlgAg&sensor=false',
  'test/support/*.coffee',
  'test/integration/*.coffee'  
];


// list of files to exclude
exclude = [];


// test results reporter to use
// possible values: 'dots', 'progress', 'junit'
reporters = ['progress'];


// web server port
port = 9876;


// cli runner port
runnerPort = 9100;


// enable / disable colors in the output (reporters and logs)
colors = true;


// level of logging
// possible values: LOG_DISABLE || LOG_ERROR || LOG_WARN || LOG_INFO || LOG_DEBUG
logLevel = LOG_INFO;


// enable / disable watching file and executing tests whenever any file changes
autoWatch = true;


// Start these browsers, currently available:
// - Chrome
// - ChromeCanary
// - Firefox
// - Opera
// - Safari (only Mac)
// - PhantomJS
// - IE (only Windows)
browsers = ['Chrome'];


// If browser does not capture in given timeout [ms], kill it
captureTimeout = 60000;


// Continuous Integration mode
// if true, it capture browsers, run tests and exit
singleRun = false;

