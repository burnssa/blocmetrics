class EventsController < ApplicationController
	before_filter :set_headers
	skip_before_filter :verify_authenticity_token, only: [:create]


  def create
  	puts "TRACKED PARAMS HERE: #{params}"

  	visitor_email = params['visitor_email'] # String
  	visitor_ip = params['visitor_ip'] #IP Address
  	topic_view = params['topic_view'] #count
  	bookmark_view = parms['bookmark_view'] #count
  	visit_end = params['visit_end'] || [] #time

		puts "#{visitor}"
		puts "there was a new page view" if uniq_view?
		puts "there was a topic view" if topic_view? 
		puts "there was a new bookmark view" if bookmark_view?
  end

  #create events within a single 'visit', when a registered user logs in
  #visit will have 
  	# - unique IP address, 
  	# - email address
  	# - referer
  	# - topic_views
  	# - bookmark_views

  visit = Visit.create!(email: visitor_email, ip: visitor_ip, visit_start: created_at)

 	
  visit_end = 

 


  private

  def set_headers
  	Access-Control-Allow-Origin: *
		Access-Control-Allow-Methods: POST, GET, OPTIONS
		Access-Control-Allow-Headers: Content-Type
		Access-Control-Max-Age: 1728000
  end

end
