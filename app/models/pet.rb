class Pet < ActiveRecord::Base
  enum ages: [:young, :adult]
  enum sex: [:male, :female]
  enum state: [:adoption, :adopted]
  enum size: [:small, :medium, :big]
  enum specie: [:dog, :cat]

  after_initialize :set_default_state, :if => :new_record?

  validates :name, presence: true
  validates :specie, presence: true
  validates :breed, presence: true
  validates :sex, presence: true
  validates :description, presence: true
  validates :location, presence: true

  belongs_to :user

  def set_default_state
    self.state ||= :adoption
  end
end
