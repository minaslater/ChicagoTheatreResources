class Interpreter < ApplicationRecord
  has_many :emails, as: :recipient, dependent: :destroy
  has_many :phones, as: :owner, dependent: :destroy
  accepts_nested_attributes_for :emails
  accepts_nested_attributes_for :phones

  def name
    "#{first_name} #{last_name}"
  end
end
