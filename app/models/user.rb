class User < ApplicationRecord
    has_many :user_tests, dependent: :destroy
    has_many :tests, foreign_key: "author_id" ,through: :user_tests, dependent: :destroy
    
    def tests_passed(level)
        Test.joins(:user_tests)
        .where(tests: { level: level }, user_tests: { user_id: id })
    end
end
