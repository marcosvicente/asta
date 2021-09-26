class CreateDataVisualizationItems < ActiveRecord::Migration[6.1]
  def change
    create_table :data_visualization_items do |t|
      t.string :cx
      t.string :cy
      t.string :r
      t.string :data_id
      t.references :data_visualization, null: false, foreign_key: true

      t.timestamps
    end
  end
end
