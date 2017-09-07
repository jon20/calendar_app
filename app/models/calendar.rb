class Calendar < ApplicationRecord
  
  

  def self.create_calendar(date, id)
    arr = []
    ed =42

    day = Calendar.where(date: date.beginning_of_month..date.end_of_month)
    user = Schedule.where(user_id: id)

    day.each do |n|
      hs = {}
      schedule = user.find_by(date: n.date)
      if(schedule.nil?)
        hs[:date] = n
        hs[:schedule] = nil
      else
        hs[:date] = n
        hs[:schedule] = schedule
      end
      arr << hs
    end

    fg = day.first.date.beginning_of_month
    fg = fg.wday

    fg.times do
      push = {}
      push[:date] = nil
      push[:schedule] = nil
      arr.unshift(push)
    end

    (ed - arr.length).times do
      push = {}
      push[:date] = nil
      push[:schedule] = nil
      arr.push(push)
    end
    
    arr = arr.each_slice(7).to_a
    
  end
end
