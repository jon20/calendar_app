class CalendarController < ApplicationController
  before_action :sign_in_required, only: [:mainpage]
  def mainpage
  end


end
