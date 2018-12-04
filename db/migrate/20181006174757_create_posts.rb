class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.references :user, foreign_key: true,null:false
      t.string :title, index:true
      t.text :text, null:false
      t.boolean :pub_sub
      t.string :artist_name, null:false
      t.string :track_name, null:false
      t.string :track_image, null:false
      t.string :preview_url, null:false

      t.timestamps
    end
  end
end
