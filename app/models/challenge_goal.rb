class ChallengeGoal < ApplicationRecord
  belongs_to :user
  belongs_to :challenge
  has_many :log_scores, :dependent => :destroy

  validates_presence_of attribute_names.select {
      |attr| attr != "id" &&
       attr != "created_at" &&
        attr != "updated_at" 
      }
  
    validates_numericality_of attribute_names.select {
      |attr| attr != "id" &&
       attr != "created_at" &&
        attr != "updated_at" 
      }, greater_than: 0 

  def cg_create_log_scores
    self.user.logs.each do |log|
      if log.log_date >= self.challenge.start_date && log.log_date <= self.challenge.end_date
          @ls = self.log_scores.build
          @ls.log_id = log.id
          @ls.logic
          # logic(@ls)
          @ls.save
      end
    end
  end
  
end
