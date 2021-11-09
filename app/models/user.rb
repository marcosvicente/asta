class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable

  validate :update_create_when_admin
  validates :email, uniqueness: true
  enum kind: [:commom, :admin]

  paginates_per 50

  def human_kind
    User.human_enum_name(:kind, self.kind) if self.kind
  end

  def update_create_when_admin
    errors.add(:kind, "not be save!") != :admin if self.kind 
  end
end
