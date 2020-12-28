class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  
  has_many :questions, dependent: :destroy
  has_many :user_tests, dependent: :destroy
  has_many :users, through: :tests_users
  
  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }
  scope :with_category, -> (category_pass) { joins(:category)
                                        .where({ categories: { title: category_pass}})}
  validates :title, presence: true
  validates :title, uniqueness: {scope: :level}
  validates :level, numericality: {only_integer: true, greater_than_or_equal: 0}
  
  def self.names_by_category(category)
    with_category(category).order(title: :desc).pluck(:title)
  end
end
