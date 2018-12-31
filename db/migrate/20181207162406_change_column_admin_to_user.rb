class ChangeColumnAdminToUser < ActiveRecord::Migration[5.1]
  def up
    change_column_null :users, :admin, false, 0
    change_column :users, :admin, :boolean, default: 0
  end

  # 変更前の状態
  def down
    change_column_null :users, :admin, true, nil
    change_column :users, :admin, :boolean, default: nil
  end
end
