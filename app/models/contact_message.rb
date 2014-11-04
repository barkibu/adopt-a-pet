class ContactMessage
  include ActiveModel::Model
  extend ActiveModel::Translation

  attr_accessor :name, :email, :subject, :body

  validates :name, :email, :subject, :body, presence: true
  validates :email, email: true, allow_blank: true

  def self.i18n_scope
    :activerecord
  end
end
