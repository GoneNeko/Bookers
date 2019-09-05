class Book < ApplicationRecord
  belongs_to :user

  validates :title, :body,
  length: { maximum: 200 },
  presence: true
end
