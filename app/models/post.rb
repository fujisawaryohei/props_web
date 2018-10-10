class Post < ApplicationRecord
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :clpis, dependent: :destroy
  belongs_to :user
end
