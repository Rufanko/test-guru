class User < ApplicationRecord

	has_many :test_passages, dependent: :destroy
	has_many :tests, through: :test_passages
	has_many :authors_tests, class_name: 'Test', foreign_key: 'author_id', dependent: :nullify
	has_many :gists, dependent: :nullify
	has_many :user_badges, dependent: :nullify
	has_many :badges, through: :user_badges


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable, :confirmable

	def find_by_level(level)
	  tests.where(level: level)
	end

	def test_passage(test)
		self.test_passages.order(id: :desc).find_by(test: test)
	end

  def admin?
    is_a?(Admin)
  end

end
