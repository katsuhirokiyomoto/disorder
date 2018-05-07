class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :code
      t.string :name
      t.string :url
      t.string :image_url
      t.string :type

      t.timestamps
    end
  end
end
