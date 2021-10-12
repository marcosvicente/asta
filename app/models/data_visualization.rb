class DataVisualization < ApplicationRecord
  belongs_to :import

    #kamikari
    paginates_per 50
end
