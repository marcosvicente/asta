class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable

  validates :email, uniqueness: true
  enum kind: [:commom, :admin]

  paginates_per 50

  def human_kind
    User.human_enum_name(:kind, self.kind) if self.kind
  end

end
