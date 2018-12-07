class ChangeColumnAdminToUser < ActiveRecord::Migration[5.1]
  def up
        change_column :users, :admin, :boolean, null:false, default: 0
  end

  # 変更前の状態
  def down
    change_column :users, :admin, :boolean, null:false
  end
end
