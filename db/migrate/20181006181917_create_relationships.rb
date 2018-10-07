class CreateRelationships < ActiveRecord::Migration[5.1]
  def change
    create_table :relationships do |t|
      t.references :follower, foreign_key: true,null:false,index:true
      t.references :followed, foreign_key: true,null:false,index:true

      #t.timestamps
    end
  end
end
