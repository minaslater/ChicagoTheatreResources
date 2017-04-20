class Interpreter < ApplicationRecord
  has_many :emails, as: :recipient, dependent: :destroy
  has_many :phones, as: :owner, dependent: :destroy

  def name
    "#{first_name} #{last_name}"
  end
end
