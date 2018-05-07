class CreateInstitutions < ActiveRecord::Migration[5.1]
  def change
    create_table :institutions do |t|
      t.string :name
      t.string :url
      t.string :location
      t.string :type

      t.timestamps
    end
  end
end
