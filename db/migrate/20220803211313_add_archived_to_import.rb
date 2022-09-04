class AddArchivedToImport < ActiveRecord::Migration[6.1]
  def change
    add_column :imports, :archived, :boolean, default: false
  end
end
