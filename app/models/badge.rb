class Badge < ApplicationRecord

    has_many :user_badges, dependent: :nullify
    has_many :users, through: :user_badges

    validates :title, :image_url, :rule, presence: true
    validates :rule, uniqueness: {scope: :title, message: 'same badge already exists'}

end
