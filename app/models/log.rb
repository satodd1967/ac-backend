class Log < ApplicationRecord
  belongs_to :user
  has_many :log_scores, :dependent => :destroy

  def create_log_scores
    self.user.challenge_goals.each do |cg|
      if self.log_date >= cg.challenge.start_date && self.log_date <= cg.challenge.end_date
          @ls = cg.log_scores.build
          @ls.log_id = self.id
          @ls.logic
          # logic(@ls)
          @ls.save
      end
    end
  end

  def update_log_scores
    self.log_scores.each do |ls|
      ls.logic
      # logic(ls)
      ls.save
    end
  end
  
end
