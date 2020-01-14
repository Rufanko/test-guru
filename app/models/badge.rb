class Badge < ApplicationRecord
    BADGE_TITLES = %i[first_try_badge all_in_category_badge certain_level_badge].freeze

    has_many :user_badges, dependent: :nullify
    has_many :users, through: :user_badges

    validates :title, :image_url, :rule, presence: true

end
