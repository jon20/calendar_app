class Schedule < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :body, presence: true
  validates :date, presence: true
  validate :check_schedule  ,on: :create

  def check_schedule
    ans =  Schedule.find_by(user_id: self.user_id, date: self.date) 
    if(ans.present?)
        errors.add(:title, "you can only registrate 1 task")
    end
  end
    
end
