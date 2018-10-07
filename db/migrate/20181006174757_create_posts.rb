class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.references :user, foreign_key: true,null:false
      t.string :title,index:true,null:false
      t.text :text,null:false
      t.boolean :pub_sub,null:false
      t.string :track_image,null:false

      t.timestamps
    end
  end
end
