class Interpreter < ApplicationRecord
  has_many :emails, as: :recipient, dependent: :destroy
  has_many :phones, as: :owner, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :accreditation, presence: true

  def name
    "#{first_name} #{last_name}"
  end
end
