# frozen_string_literal: true
class Test < ApplicationRecord
  
  has_many :questions
  belongs_to :category
  has_many :tests_users
  has_many :users, through: :tests_users
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  def self.all_tests_by_category(category)
    Test.joins('INNER JOIN categories ON  categories.id = tests.category_id' ).where(categories: { name: category })
                                                                     .order(id: :desc)
                                                                     .pluck(:title)
  end
end
