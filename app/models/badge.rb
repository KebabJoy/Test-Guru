class Badge < ApplicationRecord

  validates :name, presence: true
  validates :rule, presence: true
  validates :img_url, presence: true, :format => {
                                                  :with => %r{\.(jpg|png)\z}i,
                                                  :message => 'must be a URL for GIF, JPG or PNG image.'
                                                }

  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges

  RULES = [
    :first_try,
    :all_of_level,
    :all_from_category
  ]
end
