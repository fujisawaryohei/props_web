class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :timeoutable
  has_many :posts, dependent: :destroy

  has_many :likes, dependent: :destroy

  has_many :following_relationships,
  class_name: "Relationship",
  foreign_key: "follower_id",
  dependent: :destroy
  has_many :followings, through: :following_relationships

  has_many :follower_relationships,
  class_name: "Relationship",
  foreign_key: "following_id",
  dependent: :destroy
  has_many :followers, through: :follower_relationships

  has_many :clips, dependent: :destroy

  has_many :notifications, dependent: :destroy

  has_many :comments, dependent: :destroy

  mount_uploader :image, ImageUploader

  validates :name, uniqueness: { case_sensitive: :false }, length: { minimum: 1, maximum: 20 }
end
