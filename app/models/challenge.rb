class Challenge < ApplicationRecord
  belongs_to :user
  has_many :challenge_goals, :dependent => :destroy 
  has_many :users, through: :challenge_goals
  has_many :logs, through: :users
  has_many :log_scores, through: :challenge_goals

  def set_challenge_end_date_create
    if self.start_date && self.start_date != "" && self.duration
      self.end_date = (self.start_date.to_date + (self.duration*7)).to_s
    end
  end

  def set_challenge_end_date_update
    if self.start_date && self.duration
      self.end_date = (self.start_date.to_date + (self.duration*7)).to_s
    end
  end
  
end
