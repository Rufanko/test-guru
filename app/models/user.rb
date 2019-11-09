class User < ApplicationRecord
	has_and_belongs_to_many :tests
	def find(level)
	Test.joins('JOIN users_tests ON users_tests.test_id = test.id').where
	('tests.level= :level AND users_tests.users_id= :id', level:level, id: id)
	end
end

