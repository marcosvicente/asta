class ClusterInfo < ApplicationRecord
  belongs_to :import
  belongs_to :type_algorithm
end
