class User < ApplicationRecord
	has_many :tests_users, dependent: :destroy
	has_many :tests, through: :tests_users
	has_many :authors_tests, class_name: 'Test', foreign_key: 'author_id', dependent: :nullify

	def find_by_level(level)
	  self.tests.where(tests: { level: level})
	end

end

