class CreateNotifications < ActiveRecord::Migration[5.1]
  def change
    create_table :notifications do |t|
      t.references :user, foreign_key: true
      t.references :post, foreign_key: true
      t.references :notified_by #誰によって通知が発生したかを保存
      t.string :notified_type
      t.boolean :read, default: false
      t.timestamps
    end
    add_foreign_key :notifications, :users, column: :notified_by_id
  end
end
