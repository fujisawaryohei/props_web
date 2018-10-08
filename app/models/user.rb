class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :timeoutable
  has_many :posts, dependent: :destroy

  has_many :likes, dependent: :destroy

  has_many :active_relationships,
  class_name: "Relationshp",
  foreign_key: "follower_id",
  dependent: :destroy

  has_many :passive_relationships,
  class_name: "Relationship",
  foreign_key: "followed_id",
  dependent: :destroy

  has_many :following, through: :active_relationships, source: :followed 

  has_many :follower, through: :passive_relationships, source: :following

  has_many :clips, dependent: :destroy

  has_many :notifications, dependent: :destroy

  has_many :comments, dependent: :destroy
end