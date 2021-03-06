class EventsController < ApplicationController
  layout 'main'
  
  before_action :init, unless: -> { logged_in? }

  def new
  end

  def index
    begin
      @events = @user.events.all.order('time DESC')
    rescue
      @events = []
    end
  end

  def daily_events(day = DateTime.now)
    events = []
    @user.events.all.each do |event|
      events.push(event) if event.start_time.at_beginning_of_day == day.at_beginning_of_day
    end
    events
  end
  
  def create
    @event = @user.events.new(event_params)
    @event.created_at = DateTime.now
    if @event.save
      redirect_to events_path
    else
      flash[:error] = "Failed to save this event."
      redirect_to new_event_path
    end
  end

  def show
    @event = @user.events.find(params[:id])
    puts @event.inspect
  end

  def edit
    @event = @user.events.find(params[:id])
  end

  def update
    @event = @user.events.find(params[:id])
    @event.updated_at = DateTime.now
    if @event.update(event_params)
      redirect_to event_path(@event)
    else
      redirect_to edit_event_path(@event)
    end
  end

  def destroy
    @event = @user.events.find(params[:id])
    @event.destroy
    redirect_to events_path
  end

  private

  def event_params
    params.require(:event).permit(:name, :start_time, :end_time, :description, :done, :upadted_at, :created_at)
  end
end
