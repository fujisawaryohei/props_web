class Post < ApplicationRecord
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :clips, dependent: :destroy
  belongs_to :user
  validates :title,presence:true
  validates :title,length:{maximum:20}
  validates :text,presence:true
  validates :text,length:{maximum:500}
  validates :artist_name,presence:true
  validates :track_name,presence:true
  validates :track_image,presence:true
end
