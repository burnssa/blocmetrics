class EventsController < ApplicationController
	before_filter :set_headers
	skip_before_filter :verify_authenticity_token, only: [:create]

  respond_to :json

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)
    @event.ip_address = request.env["REMOTE_HOST"]
    respond_to do |format|
      if @event.save
        format.html { redirect_to events_path, notice: 'Event was successfully created.' }
        format.json { render action: 'show', status: :created, location: events_path }
      else
        format.html { render action: 'new' }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def index
    @events = Event.all
    @visits = Event.visits
    @visit_count = Event.visit_count
    @email_visits = Event.email_visits
    @ips = Event.ips
    @email_count = Event.email_count
    @clicks = Event.where(name: 'click')
    @emails = Event.emails
    #@events_type = @events.where(type: "click")
  end

  def show
    @event = Event.find(params[:id])
    @location = @event.location
  end

  private

  def set_headers
    if request.headers["HTTP_ORIGIN"]
    	headers['Access-Control-Allow-Origin'] = request.headers["HTTP_ORIGIN"]
      headers['Access-Control-Expose-Headers'] = 'ETag'
      headers['Access-Control-Allow-Methods'] = 'GET, POST, PATCH, PUT, DELETE, OPTIONS, HEAD'
      headers['Access-Control-Allow-Headers'] = '*,x-requested-with,Content-Type,If-Modified-Since,If-None-Match'
  		headers['Access-Control-Max-Age'] = '1728000'
      headers['Access-Control-Allow-Credentials'] = 'true'
    end
  end

  def event_params
    params.require(:event).permit(:name, :location, :property_1, :property_2, :ip_address)
  end

end
