class CalendarController < ApplicationController
  before_action :sign_in_required, only: [:mainpage]
  def mainpage
      @day = Calendar.all
  end


end
