# == Schema Information
#
# Table name: data_visualization_items
#
#  id                    :bigint           not null, primary key
#  cluster               :string
#  cx                    :decimal(, )
#  cy                    :decimal(, )
#  r                     :decimal(, )
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  data_id               :string
#  data_visualization_id :bigint           not null
#
# Indexes
#
#  index_data_visualization_items_on_data_visualization_id  (data_visualization_id)
#
# Foreign Keys
#
#  fk_rails_...  (data_visualization_id => data_visualizations.id)
#
class DataVisualizationItem < ApplicationRecord
  attribute :r_scale, :integer

  belongs_to :data_visualization
end
