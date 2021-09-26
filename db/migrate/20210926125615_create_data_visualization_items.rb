class CreateDataVisualizationItems < ActiveRecord::Migration[6.1]
  def change
    create_table :data_visualization_items do |t|
      t.integer :cx
      t.integer :cy
      t.integer :r
      t.string :data_id
      t.string :cluster
      t.references :data_visualization, null: false, foreign_key: true

      t.timestamps
    end
  end
end
