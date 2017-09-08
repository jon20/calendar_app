class SchedulesController < ApplicationController


  def index

  end

  def create
    @schedule = Schedule.new(schedule_params)
    if @schedule.user_id = current_user.id
        unless @schedule.save
          
          flash[:warning] = "Faild"
        else
          flash[:success] = "saved"
        end
    end
    if @date.nil?
      @date = Date.today
    end
    @arr = Calendar.create_calendar(@date, current_user)
    redirect_to calendar_index_url

  end


  private
    def schedule_params
      params.require(:schedule).permit(:title, :body, :date)
    end
end
