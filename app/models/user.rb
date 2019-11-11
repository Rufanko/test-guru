class User < ApplicationRecord
	#SELECT "name" FROM "tests" INNER JOIN categories on tests.category_id = category_id WHERE "categories"."name" = ? ORDER BY "tests"."id" DESC  [["name", "RoR"]]

	def find(level)
	  Test.joins("JOIN user_tests ON user_tests.test_id = test.id")
	  .where(tests: { level: level},  user_tests: { user_id: id})
	end

end

