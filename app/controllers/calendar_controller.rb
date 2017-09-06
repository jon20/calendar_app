class CalendarController < ApplicationController
  before_action :sign_in_required, only: [:mainpage]
  def index
      @arr = []
      ed = 42
      if @date.nil?
        @date = Date.today
      end
      day = Calendar.where(month: @date.month )

      day.each do |n|
          @dy = n.date
          @arr << @dy.day
      end
      
      fg = day.first.date.beginning_of_month
      fg = fg.wday 
      fg.times do
          @arr.unshift(nil)
      end

      (ed - @arr.length).times do
        @arr.push(nil)
      end



      @arr = @arr.each_slice(7).to_a
      
  end

  def show

  end

  def next

      @date = Date.new(params[:year].to_i, params[:month].to_i + 1, 1)
      ed =42
      @arr = []
      if @date.nil?
        @date = Date.today
      end
      day = Calendar.where(month: @date.month )

      day.each do |n|
          @dy = n.date
          @arr << @dy.day
      end
      
      fg = day.first.date.beginning_of_month
      fg = fg.wday 
      fg.times do
          @arr.unshift(nil)
      end

      (ed - @arr.length).times do
        @arr.push(nil)
      end
      
      @arr = @arr.each_slice(7).to_a
      render template: "/calendar/index"
  end


end
