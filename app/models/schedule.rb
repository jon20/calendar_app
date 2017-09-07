class Schedule < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :body, presence: true
  validates :date, presence: true

  def user_schedule(date)
    
  end
end
