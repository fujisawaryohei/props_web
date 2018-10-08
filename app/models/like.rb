class Like < ApplicationRecord
  has_many :notification, dependent: :destroy
  belongs_to :user
  belongs_to :post
end
