class User < ApplicationRecord
    has_many :user_tests
    has_many :tests, foreign_key: "author_id" ,through: :user_tests, dependent: :destroy
                                  
    validate :name, presence: true
                                
    def tests_passed(lvl)
        tests.where(level: lvl) # По идее за счет ассоциации пользователь имеет только свои тесты
    end
end
