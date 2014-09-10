class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :async, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

  enum role: [:user, :admin]
  after_initialize :set_default_role, :if => :new_record?

  validates :email, presence: true, email: true

  has_many :pets

  def set_default_role
    self.role ||= :user
  end
end
