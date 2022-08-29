class User < ApplicationRecord
  has_many :blogs,dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :comments,dependent: :destroy
  has_many :notifications, as: :recipient, dependent: :destroy

  enum role: [:user, :admin]
  after_initialize :set_default_role, if: :new_record?

   private

  def set_default_role
    self.role ||= :user
  end
end
