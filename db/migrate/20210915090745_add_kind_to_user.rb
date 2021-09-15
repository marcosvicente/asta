class AddKindToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :kind, :integer, default: 0
  end
end
