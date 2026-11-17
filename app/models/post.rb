class Post < ApplicationRecord
  belongs_to :user # foreign key and index referencing user table

  has_one_attached :photo
  has_many :comments, dependent: :destroy

  validates :photo, :description, :user_id, presence: true
  # making sure that user_id,photo,description is present
  # post can receive votes
  acts_as_votable
end
