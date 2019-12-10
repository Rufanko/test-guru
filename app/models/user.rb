class User < ApplicationRecord

	has_many :test_passages, dependent: :destroy
	has_many :tests, through: :test_passages
	has_many :authors_tests, class_name: 'Test', foreign_key: 'author_id', dependent: :nullify
	validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
	validates :email, uniqueness: true

	has_secure_password

	def find_by_level(level)
	  tests.where(level: level)
	end

	def test_passage(test)
		self.test_passages.order(id: :desc).find_by(test: test)
	end

end
