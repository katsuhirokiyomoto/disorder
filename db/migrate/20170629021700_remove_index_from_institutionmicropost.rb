class RemoveIndexFromInstitutionmicropost < ActiveRecord::Migration[5.1]
  def change
    remove_index :institutionmicroposts, [:user_id, :institution_id]
  end
end
