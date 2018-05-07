class AddIndexToInstitutionmicroposts < ActiveRecord::Migration[5.1]
  def change
    add_index :institutionmicroposts, [:user_id, :institution_id], unique: true
  end
end
