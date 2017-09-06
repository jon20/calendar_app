class Calendar < ApplicationRecord
  
  
  def previous
  end

  def self.create_calendar(date)
    arr = []
    ed =42
    day = Calendar.where(date: date.beginning_of_month..date.end_of_month)
    day.each do |n|
      tmp = n.date
      arr << tmp.day
    end

    fg = day.first.date.beginning_of_month
    fg = fg.wday
    fg.times do
      arr.unshift(nil)
    end

    (ed - arr.length).times do
      arr.push(nil)
    end
    
    arr = arr.each_slice(7).to_a

  end
end
