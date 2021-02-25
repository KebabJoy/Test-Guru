require 'digest/sha1'

class User < ApplicationRecord

    has_many :user_tests
    has_many :authored_tests, foreign_key: "author_id" ,through: :user_tests, dependent: :nullify
    has_many :test_passages
    has_many :tests, through: :test_passages

    validates :name, presence: true
    validates :email, presence: true, uniqueness: true, format: /\w+[@]+\w+[.]+\w/

    has_secure_password

    def tests_passed(lvl)
        tests.where(level: lvl)
    end

    def test_passage(test)
        test_passages.order(id: :desc).find_by(test_id: test.id)
    end
end
