class User < ApplicationRecord
	has_many :tests_users
	has_many :tests, through: :tests_users
	has_many :authors_tests, class_name: "Test", foreign_key: 'user_id'

	def find_by_level(level)
	  Test.joins("JOIN user_tests ON user_tests.test_id = tests.id ").where(tests: { level: level},  user_tests: { user_id: id})
	end

end

