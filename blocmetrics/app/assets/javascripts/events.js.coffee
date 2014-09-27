# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

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

# // don't do anything here, we don't want to interfere with the behavior of the host site

        };

        _bm_request.send(JSON.stringify(_bm_event));

    };

    return submitted;

})();