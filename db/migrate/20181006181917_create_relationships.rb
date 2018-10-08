class CreateRelationships < ActiveRecord::Migration[5.1]
  def change
    create_table :relationships do |t|
      t.integer :follower, foreign_key: true,null:false, index:true, unique:true
      t.integer :followed, foreign_key: true,null:false, index:true, unique:true

      #t.timestamps
    end
  end
end
