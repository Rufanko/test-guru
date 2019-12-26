class Gist < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :question, optional: true

  validates :url, presence: true

  def hash
    url.split("/")[-1]
  end

end
