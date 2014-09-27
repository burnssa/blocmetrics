// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require Chart

var blocmetrics = (function () {
    var submitted = {};
    _bm_event = {};

    my.track = function(name, arg_1, arg_2, arg_3) {
            _pm_event.name = name;
            _pm_event.property_1 = arg_1.property_1;
            _pm_event.property_2 = arg_2.property_2;
            _pm_event.property_3 = arg_3.property_3;
            _send_data();
    };

    function _send_data() {
        _bm_request = new XMLHttpRequest();
        _bm_request.open("POST", "http://localhost:3000/events.json", true);
        _bm_request.setRequestHeader('Content-Type', 'application/json');
        _bm_request.onreadystatechange = function () {

            // don't do anything here, we don't want to interfere with the behavior of the host site

        };

        _bm_request.send(JSON.stringify(_pm_event));

    };

    return submitted;

})();