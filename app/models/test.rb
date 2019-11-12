# frozen_string_literal: true

class Test < ApplicationRecord
  def self.all_tests_by_category(category)
    Test.joins('INNER JOIN categories ON  categories.id = tests.category_id' ).where(categories: { name: category })
                                                                     .order(id: :desc)
                                                                     #.pluck(:title)
  end
end
