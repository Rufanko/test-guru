class Test < ApplicationRecord
	has_and_belongs_to_many :users
	has_many :questions
	belongs_to :category
end
