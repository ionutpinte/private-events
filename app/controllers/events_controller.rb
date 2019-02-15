class EventsController < ApplicationController

    def new
        @event = Event.new
    end

    def create

        @event = Event.new(event_params)
        @event.creator_id = session[:user_id]

        if @event.save
            edirect_to user_path(@event.creator_id)
        else
            render :new
        end

    end

    def edit
        @event = Event.find(params[:id])
    end

    def update
        @event = Event.find(params[:id])

        if @event.update(event_params)
            redirect_to event_path(@event)
        else
            render :edit
        end
    end

    def destroy
        @event = Event.find(params[:id])
        @event.destroy
        redirect_to user_path(session[:user_id])
    end

    def show
        @event = Event.find(params[:id])
        @attendees = @event.attendees
        session[:event_id] = @event.id
        @attendments = Attendment.all
    end

    private

        def event_params
            params.require(:event).permit(:name, :location, :description, :date)
        end


end
