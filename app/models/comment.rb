class Comment < ApplicationRecord
  #has_many :sub_comments, dependent: :destroy
  belongs_to :user
  belongs_to :post
  validates :comment_text, presence:true
  validates :comment_text, length:{maximum:150}
end
