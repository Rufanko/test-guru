# frozen_string_literal: true

class Test < ApplicationRecord
  #SELECT "name" FROM "tests" INNER JOIN categories on tests.category_id = category_id WHERE "categories"."name" = ? ORDER BY "tests"."id" DESC  [["name", "RoR"]]
  def self.all_tests_by_category(category)
    joins('INNER JOIN categories on tests.category_id = category_id').where(categories: { name: category })
                                                                     .order(id: :desc)
                                                                     .pluck(:name)
  end
end
