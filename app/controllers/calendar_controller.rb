class CalendarController < ApplicationController
  before_action :sign_in_required
  def index
      @schedule = Schedule.new
  
      if @date.nil?
        @date = Date.today
      end
      @arr =   Calendar.create_calendar(@date, current_user)


  end

  def show

      @tmp = Schedule.find(params[:id])
  end


  def next
      @arr = []
      @schedule = Schedule.new
      if (params[:month].to_i == 12)
          
          @date = Date.new(params[:year].to_i + 1, params[:month].to_i - 11, 1)
      
      else

          @date = Date.new(params[:year].to_i, params[:month].to_i + 1, 1)
      end
      @arr = Calendar.create_calendar(@date, current_user)

      render template: "/calendar/index"
  end

  def edit
        
      @tmp = Schedule.find(params[:id])
  end

  def destroy
      Schedule.find(params[:id]).destroy
      flash[:success] = "Task deleted"
      redirect_to calendar_index_url
  end

  def previous
      @arr = []
      @schedule = Schedule.new

      if (params[:month].to_i == 1)
          @date = Date.new(params[:year].to_i - 1, params[:month].to_i + 11, 1)
      else
          @date = Date.new(params[:year].to_i, params[:month].to_i - 1, 1)
      end

      @arr = Calendar.create_calendar(@date, current_user)

      render template: "/calendar/index"

  end


end
