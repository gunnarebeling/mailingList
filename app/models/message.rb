class Message < ApplicationRecord
  belongs_to :user
  validates :subject, :body, presence: true
  def sender
    user.email
  end
end
