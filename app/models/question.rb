class Question < ApplicationRecord
    belongs_to :test
    has_many :answers, dependent: :destroy
    validates :body, presence: true
    validate :answers_limit, on: :update
    
    def answers_limit
       errors.add(:body.capitalize, message: "answers count is out of range") if self.answers.count > 4 
    end
end
