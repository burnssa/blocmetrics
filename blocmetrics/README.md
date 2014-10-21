== README

Here is what you need to do in order to track data using the blocmetrics analytics tool for tracking page views and clicks on specific links within your application.


1. Copy the javascript snippets below to the application.js file in the application for whose events you'd like to track. 

``
var blocmetrics = function(name, location, property_1, property_2){
  var _bm_event = {
    name: 'event label',
    location: 'website domain',
    property_1: 'property of event you choose',
    property_2: 'property of event you choose'
  }

  var _bm_request = $.ajax({
    url: "http://blocmetrics.herokuapp.com/events.json",
    crossDomain: true,
    xhrFields: {
      withCredentials: true
    },
    method: "post",
    data: {event: _bm_event}
  })
}
``

2. Insert the following snippet into the view for the page on which you'd like to track events. Note that the following is in haml. If you need to convert the snippet to erb, you can use the website https://haml2erb.org/ to do so. Ensure that you include it at the bottom of your %body section in the view.

``
:javascript
	$(document).ready(function(){
		//declare variables for event properties you'd like to track here
		//This section allows you to track page views
		blocmetrics('name', window.location.origin, 'property_1', 'property_2')
			//This section allows you to track link clicks - you can omit it //and step 3 if you don't desire to track clicks 
			$("a.trackable").on("click", function(){
				alert( "test" );
				blocmetrics('click', $(this).data("track"), 'property_1', 'property_2');
			}
		)
	})
``

3. To track clicks of a given link, with the following features

```
#{link_to("See more", topic_path(topic))}
```

update the link_to arguments so that the link looks as such: 

```
#{link_to(" See more", topic_path(topic), class: "trackable", "data-track" => "Topic selection")}
```

You can add and track custom features (such as user email address or referring page) by updating property 1 and property 2 accordingly.

4. Check out the event graphs in the root of your blocmetrics application. There you'll see a frequency graph for visitors' ip addresses and a pie chart showing relative frequency of link clicks for users with the unique property you define in 'property 1'.
