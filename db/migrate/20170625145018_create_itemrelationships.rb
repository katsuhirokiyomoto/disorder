class CreateItemrelationships < ActiveRecord::Migration[5.1]
  def change
    create_table :itemrelationships do |t|
      t.references :user, foreign_key: true
      t.references :item, foreign_key: true

      t.timestamps
      
      t.index [:user_id, :item_id], unique: true
    end
  end
end
