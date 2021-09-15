class Import < ApplicationRecord
  belongs_to :user

  validates :status, :name, presence: true

  enum status: [:enqueued, :processing, :done]

  # carrierwave
  mount_uploader :file, ImportUploader
end
