class EventsController < ApplicationController
	before_filter :set_headers
	skip_before_filter :verify_authenticity_token, only: [:create]

  before_filter :cors_set_headers
  after_filter :cors_set_access_control_headers

  respond_to :json

  # POST /events
  # POST /events.json
  def create
    #binding.pry

    puts params
    puts 'Info received'

    @tracked_app = TrackedApp.find(event_params[:tracked_app_id])
    @event = @tracked_app.events.build(event_params)
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



  private

  def set_headers
  	headers['Access-Control-Allow-Origin']: '*'
		headers['Access-Control-Allow-Methods']: 'POST, GET, OPTIONS'
		headers['Access-Control-Allow-Headers']: 'Content-Type'
		headers['Access-Control-Max-Age']: '1728000'
  end

  def event_params
    params.require(:event).permit(:name, :arg_1, :arg_2, :arg_3)
  end

end
