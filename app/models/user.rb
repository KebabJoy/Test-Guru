class User < ApplicationRecord
    has_many :user_tests, dependent: :destroy
    has_many :tests, through: :user_tests, dependent: :destroy
    
    def tests_passed(level)
        Test.joins('INNER JOIN user_tests ON user_tests.test_id = tests.id')
        .where(tests: { level: level }, user_tests: { user_id: id })
    end
end
