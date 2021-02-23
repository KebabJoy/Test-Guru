class Answer < ApplicationRecord
  belongs_to :question
    
  scope :correct, -> { where(correct: true) }

  validate :answers_limit, on: :create

  def answers_limit
    errors.add(:base, 'Maximum answers number is 3') if question.answers.count >= 4
  end
end
