class CreateProblemmicroposts < ActiveRecord::Migration[5.1]
  def change
    create_table :problemmicroposts do |t|
      t.references :user, foreign_key: true
      t.string :content
      t.string :title

      t.timestamps
    end
  end
end
