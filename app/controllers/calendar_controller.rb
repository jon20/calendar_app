class CalendarController < ApplicationController
  before_action :sign_in_required, only: [:mainpage]
  def index
      @arr = []
      if @date.nil?
        @date = Date.today
      end
      @arr  =   Calendar.create_calendar(@date)


  end

  def show

  end

  def next
      @arr = []

      @date = Date.new(params[:year].to_i, params[:month].to_i + 1, 1)

      @arr = Calendar.create_calendar(@date)

      render template: "/calendar/index"
  end


end
