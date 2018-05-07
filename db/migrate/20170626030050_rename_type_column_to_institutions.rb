class RenameTypeColumnToInstitutions < ActiveRecord::Migration[5.1]
  def change
    rename_column :institutions, :type, :kind
  end
end
