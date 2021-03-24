class Challenge < ApplicationRecord
  belongs_to :user
  has_many :challenge_goals, :dependent => :destroy 
  has_many :users, through: :challenge_goals
  has_many :logs, through: :users
  has_many :log_scores, through: :challenge_goals

  validates_presence_of attribute_names.select {
    |attr| attr != "id" &&
     attr != "created_at" &&
      attr != "updated_at" &&
       attr != "end_date"
      }
  validates :name, uniqueness: true
  validates :description, length: { maximum: 75 }
  validate :not_in_past, on: :create
  validates :duration, numericality: { less_than: 30 }

  def not_in_past
    if self.start_date < (Date.current - 1)
      errors.add(:start_date, "cannot be in the past" )
    end
  end

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
