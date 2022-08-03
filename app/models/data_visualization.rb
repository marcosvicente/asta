# == Schema Information
#
# Table name: data_visualizations
#
#  id         :bigint           not null, primary key
#  cluster    :string
#  cx         :string
#  cy         :string
#  r          :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  data_id    :string
#  import_id  :bigint           not null
#
# Indexes
#
#  index_data_visualizations_on_import_id  (import_id)
#
# Foreign Keys
#
#  fk_rails_...  (import_id => imports.id)
#
class DataVisualization < ApplicationRecord
  belongs_to :import
  has_many :messages
  #kamikari
  paginates_per 50
end
