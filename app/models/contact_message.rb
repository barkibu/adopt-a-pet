class ContactMessage
  include ActiveModel::Model

  attr_accessor :name, :email, :subject, :body

  validates :name, :email, :subject, :body, presence: true
  validates :email, email: true, allow_blank: true
end
