# frozen_string_literal: true

class Answer < ApplicationRecord
  belongs_to :question, optional: true
  scope :correct, -> {where(correct: true)}
  validate :validate_min_max_answers, on: :create


  def validate_min_max_answers
  	error.add(:question) if question.answers.count >= 4
  end

end
