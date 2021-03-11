class Badge < ApplicationRecord

  enum rules: {
    first_try: 0 ,
    all_of_level: 1,
    all_from_category: 2
  }.freeze
  
  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges

  validates :name, presence: true
  validates :rule, presence: true
  validates :img_url, presence: true, :format => {
                                                  :with => %r{\.(jpg|png)\z}i,
                                                  :message => 'must be a URL for GIF, JPG or PNG image.'
                                                }

end
