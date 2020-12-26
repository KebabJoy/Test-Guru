class User < ApplicationRecord
    has_many :user_tests
    has_many :tests, foreign_key: "author_id" ,through: :user_tests, dependent: :destroy
    
    scope :with_level, -> (lvl) { Test.joins(:user_tests).where(tests: {level: lvl) }
    validate :name, presence: true 
    def tests_passed(level)
        with_level, user_tests: { user_id: id })
    end
end
