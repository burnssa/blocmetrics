class TrackedAppsController < ApplicationController

	def index
	  @tracked_apps = TrackedApp.all
	end

	def new
	  @tracked_app = TrackedApp.new
	  authorize @tracked_app
	end

	def show
	  @tracked_app = TrackedApp.find(params[:id])
	  authorize @tracked_app
	end

	def create
	  @tracked_app = TrackedApp.new(app_params)
	  @TrackedApp.user = current_user
    if @TrackedApp.save
      redirect_to app_path(@tracked_app), notice: "App was added successfully." and return
    else
      flash[:error] = "Error adding TrackedApp. Please try again."
      render :new and return
	  end 
	end

	def edit
	  @tracked_app = TrackedApp.find(params[:id])
          
	  # edit action is responsible for rendering the view
	  # update action is responsible for interacting with the model
	end

	def update
	  @tracked_app = TrackedApp.find(params[:id])
    if @TrackedApp.update_attributes(app_params)
      redirect_to @tracked_app and return
    else
      flash[:error] = "Error updating TrackedApp. Please try again."
    render :edit and return
	  end
	end

	def destroy
	  @tracked_app = TrackedApp.find(params[:id])
          authorize @tracked_app
	  if @TrackedApp.destroy
            flash[:notice] = "The app #{@TrackedApp.name} was successfully deleted."
            redirect_to apps_path and return
          else
            flash[:error] = "There was an error deleting the TrackedApp."
          end
  	end

	private

	def app_params
	  params.require(:app).permit(:name, :desc)
	  # using strong_parameters here
	  # more: http://blog.sensible.io/2013/08/17/strong-parameters-by-example.html
	end
end
