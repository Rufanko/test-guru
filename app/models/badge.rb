class Badge < ApplicationRecord

    has_many :user_badges, dependent: :nullify
    has_many :users, through: :user_badges

    validates :title, :image_url, :rule, presence: true
    validates :rule, uniqueness: {scope: :title, message: 'same badge already exists'}
    validates :title, inclusion: {in: BadgeService::BADGE_TITLES, message: 'wrong title' }

    #def validate_badge_title
    #  error.add(:title) unless BadgeService::BADGE_TITLES.include?(:title)
    #end

end
