class Test < ApplicationRecord
  belongs_to :category, optional: true
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :questions, dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages, dependent: :destroy

  scope :easy, -> {where(level: 0..1)}
  scope :intermediate, -> {where(level: 2..4)}
  scope :hard, -> {where(level:5..Float::INFINITY)}
  scope :all_tests_by_category, ->(category) {self.joins(:category).where(categories: {name:category}).order(id: :desc)}

  validates :timer, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :title, uniqueness: { scope: :level, message: 'uniqueness error' }
  validates :title, presence: true
end
