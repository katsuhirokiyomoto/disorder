class CreateSolutions < ActiveRecord::Migration[5.1]
  def change
    create_table :solutions do |t|
      t.references :problemmicropost, foreign_key: true
      t.references :follower, foreign_key: { to_table: :users }
      t.string :title
      t.string :content

      t.timestamps
      
      t.index [:problemmicropost_id, :follower_id], unique: true
    end
  end
end
