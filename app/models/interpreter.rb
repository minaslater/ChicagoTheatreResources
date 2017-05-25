class Interpreter < ApplicationRecord
  has_one :email, as: :recipient, dependent: :destroy
  has_one :phone, as: :owner, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :accreditation, presence: true

  def name
    "#{first_name} #{last_name}"
  end
end
