class EventsController < ApplicationController
 	before_action :authenticate_user!, except: [:index, :show]
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :authorize_user!, only: [:edit, :update, :destroy]

  def set_event
  @event = Event.find(params[:id])
  end

  def authorize_user!
  redirect_to events_path, alert: "Not allowed" unless @event.creator == current_user
  end

  def index
    @events = Event.all
  end

  def show
  end

  def new
    @event = current_user.created_events.build
  end

  def create
    @event = current_user.created_events.build(event_params)

    if @event.save
      redirect_to @event, notice: "Event created successfully!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def attending
  end

  def created
  end

  def update

    if @event.update(event_params)
      redirect_to @event
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @event.destroy
    redirect_to events_path, status: :see_other
  end

  def attend
    @event.attend
    redirect_to events_path, status: :see_other
  end

  private

  def event_params
    params.require(:event).permit(:date, :location)
  end
end
