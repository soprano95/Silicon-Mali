class User < ApplicationRecord
  has_many :blogs
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: [:user, :admin]
  after_initialize :set_default_role, if: :new_record?

   private

  def set_default_role
    self.role ||= :user
  end
end
