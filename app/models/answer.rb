class Answer < ApplicationRecord
    belongs_to :question
    
    scope :correct, -> { where(correct: true) }
    
    validates :answers_limit, on: :create
    
    def answers_limit
      errors.add(:question) if question.answers.count >= 4
  end
end
