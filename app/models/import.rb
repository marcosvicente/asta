class Import < ApplicationRecord
  belongs_to :user

  validates :status, :name, presence: true

  enum status: [:enqueued, :processing, :done, :error]

  # carrierwave
  mount_uploader :file, ImportUploader

  #kamikari
  paginates_per 50


  def human_status
    Import.human_enum_name(:status, self.status) if self.status
  end
end
