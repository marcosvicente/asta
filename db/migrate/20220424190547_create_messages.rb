class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.text :content, null: false
      t.references :user, null: false, foreign_key: true
      t.references :data_visualization, null: false, foreign_key: true
      t.timestamps
    end
  end
end
