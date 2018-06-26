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

	private 
		def event_params
			params.require(:event).permit(:description)
		end 
end
