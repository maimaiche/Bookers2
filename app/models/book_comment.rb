class BookComment < ApplicationRecord

  belongs_to :user
  # belongs_to :book_comment

  validates :comment, presence: true

end
