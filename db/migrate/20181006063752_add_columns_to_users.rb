class AddColumnsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :name, :string, null:false, index:true
    add_column :users, :image, :string
    add_column :users, :self_comment, :text
    add_column :users, :admin, :boolean, null:false
    add_column :users, :notified_by_id, :integer ,null:false
  end
end
