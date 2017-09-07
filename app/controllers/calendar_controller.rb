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

  end

  def next
      @arr = []
      @schedule = Schedule.new

      @date = Date.new(params[:year].to_i, params[:month].to_i + 1, 1)

      @arr = Calendar.create_calendar(@date)

      render template: "/calendar/index"
  end

  def previous
      @arr = []
      @schedule = Schedule.new

      @date = Date.new(params[:year].to_i, params[:month].to_i - 1, 1)

      @arr = Calendar.create_calendar(@date)

      render template: "/calendar/index"

  end


end
