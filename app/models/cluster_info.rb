# == Schema Information
#
# Table name: cluster_infos
#
#  id                :bigint           not null, primary key
#  algorithm         :string
#  data_sets         :string
#  description       :text
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  import_id         :bigint           not null
#  type_algorithm_id :bigint           not null
#
# Indexes
#
#  index_cluster_infos_on_import_id          (import_id)
#  index_cluster_infos_on_type_algorithm_id  (type_algorithm_id)
#
# Foreign Keys
#
#  fk_rails_...  (import_id => imports.id)
#  fk_rails_...  (type_algorithm_id => type_algorithms.id)
#
class ClusterInfo < ApplicationRecord
  belongs_to :import
  belongs_to :type_algorithm
end
