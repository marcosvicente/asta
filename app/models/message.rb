# == Schema Information
#
# Table name: messages
#
#  id                    :bigint           not null, primary key
#  content               :text             not null
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  data_visualization_id :bigint           not null
#  user_id               :bigint           not null
#
# Indexes
#
#  index_messages_on_data_visualization_id  (data_visualization_id)
#  index_messages_on_user_id                (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (data_visualization_id => data_visualizations.id)
#  fk_rails_...  (user_id => users.id)
#
class Message < ApplicationRecord
  validates_presence_of :content
  belongs_to :user
  belongs_to :data_visualization
end
