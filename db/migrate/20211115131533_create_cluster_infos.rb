class CreateClusterInfos < ActiveRecord::Migration[6.1]
  def change
    create_table :cluster_infos do |t|
      t.string :data_sets
      t.string :algorithm
      t.text :description
      t.references :import, null: false, foreign_key: true
      t.references :type_algorithm, null: false, foreign_key: true

      t.timestamps
    end
  end
end
