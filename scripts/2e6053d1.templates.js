Ember.TEMPLATES.application=Ember.Handlebars.template(function(a,b,c,d,e){this.compilerInfo=[3,">= 1.0.0-rc.4"],c=c||Ember.Handlebars.helpers,e=e||{};var f,g,h="",i=this.escapeExpression;return e.buffer.push('<div>\n  <header class="navbar navbar-fixed-top" id="header">\n    <div class="navbar-inner">\n      <div class="container-fluid">\n        <div class="brand">\n          <h4>Map Locator for folks at WayMate</h4>\n        </div>\n      </div>\n    </div>\n  </header>\n  <div class="container-fluid" id="main">\n    <div class="row-fluid">\n      <div id="errorMsg" class="alert alert-error" style="display:none">\n        <button type="button" class="close" data-dismiss="alert">×</button>\n        <span id="errorText">Ops, something wrong happened :( </span>\n      </div>\n      <div id="successMsg" class="alert alert-success" style="display:none">\n        <button type="button" class="close" data-dismiss="alert">×</button>\n        <span>Found it!!</span>\n      </div>\n    </div>\n    <div class="row-fluid">\n      <div>\n        <div class="span3">\n          <div class="well sidebar-nav">\n            <span class="nav-header"><h3>MENU</h3></span>\n            <ul class="nav nav-list">\n              <li>\n                  <strong>Create new Marker</strong>\n                  <br/>\n                  <form>\n                    <input type="text" id="marker_location" placeholder="search for something..." '),f={on:b},g={on:"STRING"},e.buffer.push(i(c.action.call(b,"addMarker",{hash:{on:"onSubmit"},contexts:[b],types:["STRING"],hashContexts:f,hashTypes:g,data:e}))),e.buffer.push('>\n                    <br/>\n                    <input type="submit" value="Find" '),f={on:b},g={on:"STRING"},e.buffer.push(i(c.action.call(b,"addMarker",{hash:{on:"click"},contexts:[b],types:["STRING"],hashContexts:f,hashTypes:g,data:e}))),e.buffer.push('/>\n                  </form>\n              </li>\n              <li><strong>Browser other Markers</strong></li>\n            </ul>\n          </div>\n        </div>\n        <div class="span9">\n          '),g={},f={},e.buffer.push(i(c._triageMustache.call(b,"outlet",{hash:{},contexts:[b],types:["ID"],hashContexts:f,hashTypes:g,data:e}))),e.buffer.push("\n        </div>\n      </div>\n    </div>\n  </div>\n</div>\n"),h}),Ember.TEMPLATES.map=Ember.Handlebars.template(function(a,b,c,d,e){this.compilerInfo=[3,">= 1.0.0-rc.4"],c=c||Ember.Handlebars.helpers,e=e||{},e.buffer.push("<div id='map' class='dark' style=\"width:100%; height:700px;\"></div>\n")});