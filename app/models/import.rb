# == Schema Information
#
# Table name: imports
#
#  id         :bigint           not null, primary key
#  archived   :boolean          default(FALSE)
#  file       :string
#  message    :text
#  name       :string
#  status     :integer          default("enqueued")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_imports_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Import < ApplicationRecord
  belongs_to :user
  has_one :cluster_info
  accepts_nested_attributes_for :cluster_info, update_only: true

  validates :status, :name, presence: true

  enum status: [:enqueued, :processing, :done, :error]
  has_many :data_visualization
  # carrierwave
  mount_uploader :file, ImportUploader

  #kamikari
  paginates_per 50


  def human_status
    Import.human_enum_name(:status, self.status) if self.status
  end

end
