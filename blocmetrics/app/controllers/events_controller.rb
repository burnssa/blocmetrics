class EventsController < ApplicationController
	before_filter :set_headers
	skip_before_filter :verify_authenticity_token, only: [:create]

  before_filter :set_headers

  respond_to :json

  # POST /events
  # POST /events.json
  def create
    #binding.pry

    puts params
    puts 'Info received'

    @event = Event.new(event_params)
    @event.ip_address = request.env["REMOTE_HOST"]
    respond_to do |format|
      if @event.save
        format.html { redirect_to @tracked_app, notice: 'Event was successfully created.' }
        format.json { render action: 'show', status: :created, location: @tracked_app }
      else
        format.html { render action: 'new' }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def index
    @events = Event.all
    #@events_type = @events.where(type: "click")
  end

  def show
    @event = Event.find(params[:id])
    @location = @event.location
  end

  private

  def set_headers
  	headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
		headers['Access-Control-Allow-Headers'] = 'Content-Type'
		headers['Access-Control-Max-Age'] = '1728000'
  end

  def event_params
    params.require(:event).permit(:name, :location, :ip_address)
  end

end
