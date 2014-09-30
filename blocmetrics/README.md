== README

Here is what you need to do in order to track data using the blocmetrics analytics tool.

1. Copy the javascript snippets below for tracking page views for a specific web property, along with the event properties 

``
<script>
$(document).ready(function() {
     var page = <%= 'web-property-id' %>;
     var user_email = <%= current_user.email || blank %>;
     blocmetrics.track('Page View', 'web-property-id', user_email);
});
</script>
``



2. Paste it into your 