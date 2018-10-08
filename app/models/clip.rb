class Clip < ApplicationRecord
  has_many :posts, dependent: :destroy
  belongs_to :user
end
