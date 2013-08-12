!function(){var a;a=window.MapFinder=Ember.Application.create(),a.CONSTANTS={MAPBOX_ID:"jasalguero.map-aft8k4er",MAP_INIT:{LAT:52.5298943,LNG:13.403134300000033},PANORAMIO_URL:"http://www.panoramio.com/map/get_panoramas.php?set=public&from=0&to10&size=medium&mapfilter=true"},function(){a.MapRouter=Ember.Route.extend}.call(this),function(){a.ApplicationController=Ember.ObjectController.extend({needs:["map"],addMarker:function(){var b;return b=$("#marker_location"),Ember.isEmpty(b.val())?a.showError("I need something, anything to search!"):(this.get("controllers.map").doGeocode($("#marker_location").val()),$("#marker_location").val(""))}})}.call(this),function(){a.MapController=Ember.ObjectController.extend({mapContainer:"",mapGeocoder:"",init:function(){return this._super(),this.set("mapGeocoder",new google.maps.Geocoder)},doGeocode:function(b){var c=this;return null!=this.mapGeocoder?this.mapGeocoder.geocode({address:b},function(b){var d;return null!=b?(a.ShowSuccess("Found something, click on it to see some pics!"),d=c.createMarkerFromResponse(b),c.focusMap(d),a.getPhotosByLocation(d).done(function(a){return c.addPinToMap(d,a)})):void 0}):a.showError("Oops, something went wrong trying to find the place")},initialiseMap:function(){return this.set("mapContainer",L.mapbox.map("map",a.CONSTANTS.MAPBOX_ID).setView([a.CONSTANTS.MAP_INIT.LAT,a.CONSTANTS.MAP_INIT.LNG],14)),this.createPinPopup()},createMarkerFromResponse:function(b){var c,d,e,f;return c=null!=(e=b[0])?null!=(f=e.geometry)?f.location:void 0:void 0,d=a.Marker.create({id:a.createGUID(),lat:c.lb,lng:c.mb})},addPinToMap:function(a,b){var c;return null!=this.mapContainer?(c=this.mapContainer.markerLayer.getGeoJSON(),c.features.push(this.createPin(a,b)),this.mapContainer.markerLayer.setGeoJSON(c)):void 0},createPin:function(a,b){return{type:"Feature",geometry:{type:"Point",coordinates:[a.get("lng"),a.get("lat")]},properties:{title:"Photos","marker-size":"large","marker-color":"#E70707",images:b.map(function(a){return[a.url,a.title]})}}},createPinPopup:function(){return this.mapContainer.markerLayer.on("layeradd",function(a){var b,c,d,e,f,g,h;for(f=a.layer,b=f.feature,d=b.properties.images,h="",c=0;c<d.length;)e=d[c],h+='<div class="image'+(0===c?" active":"")+'">'+'<img src="'+e[0]+'" />'+'<div class="caption">'+e[1]+"</div>"+"</div>",c++;return g='<div id="'+b.properties.id+'" class="popup">'+"<h2>"+b.properties.title+"</h2>"+'<div class="slideshow">'+h+"</div>"+'<div class="cycle">'+'<a href="#" class="prev" onclick="return MapFinder.moveSlide(\'prev\')">&laquo; Previous</a>'+'<a href="#" class="next" onclick="return MapFinder.moveSlide(\'next\')">Next &raquo;</a>'+"</div>",f.bindPopup(g,{closeButton:!1,minWidth:320})})},focusMap:function(a){return this.mapContainer.panTo({lat:a.get("lat"),lng:a.get("lng")})}})}.call(this),function(){a.Marker=Ember.Object.extend({id:"",lat:"",lng:""})}.call(this),function(){a.ApplicationView=Ember.View.extend({templateName:"application"})}.call(this),function(){a.MapView=Ember.View.extend({templateName:"map",didInsertElement:function(){return this.get("controller").initialiseMap()}})}.call(this),function(){a.createGUID=function(){var a;return a=function(a){var b;return b=(Math.random().toString(16)+"000000000").substr(2,8),a?"-"+b.substr(0,4)+"-"+b.substr(4,4):b},a()+a(!0)+a(!0)+a()},a.showError=function(b){return a.toggleMsg($("#errorMsg"),b)},a.ShowSuccess=function(b){return a.toggleMsg($("#successMsg"),b)},a.toggleMsg=function(a,b){return a.children("span").text(b),a.fadeIn(600,function(){return setTimeout(function(){return a.fadeOut(600)},1500)})},a.getPhotosByLocation=function(b){return $.ajax(a.CONSTANTS.PANORAMIO_URL,{type:"GET",crossDomain:!0,contentType:"jsonp",dataType:"jsonp",data:{set:"public",from:0,to:10,size:"medium",mapfilter:!1,minx:b.lng-.005,miny:b.lat-.005,maxx:b.lng+.005,maxy:b.lat+.005}}).then(function(a){var b,c;return b=[],null!=(c=a.photos)&&c.forEach(function(c){return a={url:c.photo_file_url,title:c.photo_title},b.push(a)}),b})},a.moveSlide=function(a){var b,c,d;return c=$(".slideshow"),d=c.children().length,"prev"===a?(b=c.find(".active").prev(),b.index()<0&&(b=$(".image").last())):(b=c.find(".active").next(),b.index()<0&&(b=$(".image").first()),c.find(".active").removeClass("active").hide(),b.addClass("active").show()),!1}}.call(this),a.Router.map(function(){return this.resource("map",{path:"/"})})}.call(this);