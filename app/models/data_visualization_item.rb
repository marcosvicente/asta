class DataVisualizationItem < ApplicationRecord
  attribute :r_scale, :integer

  belongs_to :data_visualization
end
