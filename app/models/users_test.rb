# frozen_string_literal: true

class UsersTest < ApplicationRecord
  belongs_to :user
  belongs_to :test
end
