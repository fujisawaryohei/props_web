class Post < ApplicationRecord
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :clips, dependent: :destroy
  belongs_to :user
end
