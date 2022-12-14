# == Schema Information
#
# Table name: type_algorithms
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class TypeAlgorithm < ApplicationRecord
  validates_presence_of :name
end
