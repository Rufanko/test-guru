# frozen_string_literal: true

class Test < ApplicationRecord
  
  def self.all_tests_by_category(category)
    joins('INNER JOIN categories on tests.categories_id = categories_id').where(categories: { name: category })
                                                                     .order(id: :decs)
                                                                     .pluck(:name)
  end
end
