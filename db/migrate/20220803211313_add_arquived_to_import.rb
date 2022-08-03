class AddArquivedToImport < ActiveRecord::Migration[6.1]
  def change
    add_column :imports, :arquived, :boolean, default: false
  end
end
