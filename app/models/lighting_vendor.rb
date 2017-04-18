class LightingVendor < ApplicationRecord
  has_many :hours, foreign_key: :vendor_id
  has_many :contacts, as: :employer, dependent: :destroy
  has_many :emails, as: :recipient, dependent: :destroy
  has_many :phones, as: :owner, dependent: :destroy
  has_many :addresses, as: :location, dependent: :destroy
end
