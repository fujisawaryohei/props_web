class CreateClips < ActiveRecord::Migration[5.1]
  def change
    create_table :clips do |t|
      t.references :user, foreign_key: true, null:false
      t.references :post, foreign_key: true, null:false

      #t.timestamps
    end
  end
end
