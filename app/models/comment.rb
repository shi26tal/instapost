class Comment < ApplicationRecord
  # Rails validates the presence of both associations by default.
  belongs_to :user
  belongs_to :post

  validates :text, :post_id, :user_id, presence: true
end
