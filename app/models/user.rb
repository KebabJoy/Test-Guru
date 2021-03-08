class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable

  has_many :authored_tests, class_name: 'Test', foreign_key: "author_id" , dependent: :nullify
  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :gists
  has_many :user_badges, dependent: :destroy
  has_many :badges, through: :user_badges

  def tests_passed(lvl)
    tests.where(level: lvl)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
