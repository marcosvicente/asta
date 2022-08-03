# == Schema Information
#
# Table name: data_visualization_infos
#
#  id                         :bigint           not null, primary key
#  column                     :string
#  value                      :string
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#  data_visualization_item_id :bigint           not null
#
# Indexes
#
#  index_data_visualization_infos_on_data_visualization_item_id  (data_visualization_item_id)
#
# Foreign Keys
#
#  fk_rails_...  (data_visualization_item_id => data_visualization_items.id)
#
class DataVisualizationInfo < ApplicationRecord
  belongs_to :data_visualization_item
end
