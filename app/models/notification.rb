class Notification < ApplicationRecord
  belongs_to :notified_by, class_name: "User"
  belongs_to :user
  belogns_bo :post
end