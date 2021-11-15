class CreateDataVisualizationInfos < ActiveRecord::Migration[6.1]
  def change
    create_table :data_visualization_infos do |t|
      t.string :column
      t.string :value
      t.references :data_visualization_item, null: false, foreign_key: true

      t.timestamps
    end
  end
end
