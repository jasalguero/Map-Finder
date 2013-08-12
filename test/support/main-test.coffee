###tests = []
for file of window.__karma__.files
  tests.push file  if /Spec\.js$/.test(file)  if window.__karma__.files.hasOwnProperty(file)

requirejs.config
  
  # Karma serves files from '/base'
  baseUrl: "/base/src"
  paths:
    gmaps: 'https://maps.googleapis.com/maps/api/js?key=AIzaSyAllvcL7Taop-JvcIooF-kV5OwHQDdlgAg&sensor=false'


  
  # ask Require.js to load these files (all our tests)
  deps: tests
  
  # start test run, once Require.js is done
  callback: window.__karma__.start###