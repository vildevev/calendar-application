class EventsController < ApplicationController
	def index 
		@events = Event.all
		render json: @events, status: :ok
	end

	def create
		@event = Event.new(event_params)
		@event.save

		render json: @event, status: :created
	end

	def destroy 
		@event = Event.where(id: params[:id]).first
		if @event.destroy 
			head(:ok)
		else
			head(:unprocessable_entity)
		end
	end 

	private 
		def event_params
			params.require(:event).permit(:description)
		end 
end
