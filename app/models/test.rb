# frozen_string_literal: true
class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :questions, dependent: :destroy
  has_many :tests_users, dependent: :destroy
  has_many :users, through: :tests_users
  
  def self.all_tests_by_category(category)
    Test.joins(:category).where(categories: { name: category })
                                              .order(id: :desc)
                                              .pluck(:title)
  end
    
end
