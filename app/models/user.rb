class User < ApplicationRecord
    has_many :tests, foreign_key: "author_id" ,through: :user_tests, dependent: :nullify
    has_many :test_passages
    has_many :tests, through: :test_passages

    validates :name, presence: true
                                
    def tests_passed(lvl)
        tests.where(level: lvl)
    end

    def test_passage(test)
        test_passages.order(id: :desc).find_by(test_id: test.id)
    end
end
