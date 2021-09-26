class CreateImports < ActiveRecord::Migration[6.1]
  def change
    create_table :imports do |t|
      t.integer :status, default: 0
      t.string :file
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.text :message
      t.timestamps
    end
  end
end
