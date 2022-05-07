class Message < ApplicationRecord
  validates_presence_of :content
  belongs_to :user
  belongs_to :data_visualization
end
