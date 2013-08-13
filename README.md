Map-Finder
==========

Sample single page application to demonstrate the capabilities of a bunch of tools
including Yeoman, Ember.js, Handlebars, Mapbox, Karma, Mocha and a few external APIs.

The application is composed of a Map and a form with a free form input, on the submission of 
the form the application calls Google Geocoder api to obtain the coordinates of the place and
places a marker on the map.

At the same time calls Panoramio API to retrieve 10 pictures of the coordinates obtained. On the click
of the marker a popup is opened with a gallery of the pictures.

The aplication also shows a list with the previous locations introduced and the capability to navigate through them


Demo
====

The current production version of the application is deployed in Github page: http://jasalguero.github.io/Map-Finder/

Note: This version contains already the minified versions of css, javascript and images


Installation
============

To deploy the development version:

- Clone this repo
- Install Yeoman, Grunt and Bower (http://yeoman.io/)
- Execute 
  ```grunt server``` to launch a local server with the application
- Execute
  ```grunt test``` to launch the Karma runner and to run the integration tests (located in test/integration/index.coffee) 
- Execute
  ```grunt build``` to compile a new version of production


Libraries and APIs
==================

- Emberjs 1.0.0.rc6 (http://emberjs.com/) 
- Handlebars 1.0.0.rc4 (http://handlebarsjs.com/) 
- Yeoman 1.0.0-rc.1.2 (http://yeoman.io)
- Twitter Bootstrap 2.3.2 (http://twitter.github.com/bootstrap)
- jQuery 1.9.1 (http://jquery.com/)
- Mapbox API 1.0.0-rc.1.2 (http://www.mapbox.com/)
- Google Maps Geocoder v3 (https://developers.google.com/maps/documentation/javascript/services#Geocoding)
- Panoramio API (http://www.panoramio.com/api/data/api.html)
- Karma runner 0.8.8 (http://karma-runner.github.com/)


Notes
=====

- Even if Mapbox also offers a geocoder, the quality of the results was quite poor, that's why the application is using two map
libraries, Mapbox (with Leaflet underlying) to display the map and Google Maps to geocode the input from the user.

- The integration tests are not very stable, since Karma running Ember tests is still not able to handle ajax calls correctly, a 
way to fix this would be using Sinon to stub the ajax calls.
