class Post < ApplicationRecord
  belongs_to :user #foreign key and index referencing user table

  has_one_attached :photo

  validates :photo, :description, :presence: true
  # making sure that user_id,photo,description is present
end
