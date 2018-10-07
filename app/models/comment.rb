class Comment < ApplicationRecord
  has_many :sub_comments,dependent: :destroy
  belongs_to :user
  belongs_to :post
end
