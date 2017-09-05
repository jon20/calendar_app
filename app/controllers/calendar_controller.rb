class CalendarController < ApplicationController
  before_action :sign_in_required, only: [:mainpage]
  def mainpage
      @arr = []

      day = Calendar.all
      day.each do |n|
          @dy = n.date
          @arr << @dy.day
      end
      
      fg = day.first.date.beginning_of_month
      fg = fg.wday 
      fg.times.each do
        @arr.unshift(nil)
      end

      @arr = @arr.each_slice(7).to_a
      
  end


end
