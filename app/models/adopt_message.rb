class AdoptMessage
  include ActiveModel::Model
  extend ActiveModel::Translation

  attr_accessor :email, :body

  validates :email, :body, presence: true
  validates :email, email: true, allow_blank: true

  def self.i18n_scope
    :activerecord
  end

  def to_param
    {
      adopt_message: {
        body: body,
        email: email,
      }
    }
  end
end
