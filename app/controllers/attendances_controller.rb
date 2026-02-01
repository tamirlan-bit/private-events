class AttendancesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event

  def create
    current_user.attendances.create(event: @event)
    redirect_to @event
  end

  def destroy
    attendance = current_user.attendances.find_by(event: @event)
    attendance.destroy if attendance
    redirect_to @event
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end
end