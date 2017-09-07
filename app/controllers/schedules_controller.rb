class SchedulesController < ApplicationController


  def index

  end

  def create
    @schedule = Schedule.new(schedule_params)
    @schedule.user_id = current_user.id
    @schedule.save
    if @date.nil?
      @date = Date.today
    end
    @arr = Calendar.create_calendar(@date, current_user)
    render "calendar/index"

  end

  private
    def schedule_params
      params.require(:schedule).permit(:title, :body, :date)
    end
end
