class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :timeoutable
  has_many :posts, dependent: :destroy

  has_many :likes, dependent: :destroy

  has_many :following_relationships,
  class_name: "Relationshp",
  foreign_key: "follower_id",
  dependent: :destroy
  has_many :following, through: :following_relationships, source: :followed

  has_many :follower_relationships,
  class_name: "Relationship",
  foreign_key: "followed_id",
  dependent: :destroy
  has_many :follower, through: :follower_relationships, source: :following

  has_many :clips, dependent: :destroy

  has_many :notifications, dependent: :destroy

  has_many :comments, dependent: :destroy

#user登録関係のvalidation
validates :name, presence:true, length: {maximum: 24}
validates :email, presence:true, length: {maximum: 24}
validates :email, presence:true ,length: {minimum:6}
validates :password, presence:true, length: {maximum: 10}
validates :password, presence:true, length: {minimum:6}
end
