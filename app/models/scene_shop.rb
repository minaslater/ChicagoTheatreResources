class SceneShop < ApplicationRecord
  has_many :contacts, as: :employer, dependent: :destroy
  has_many :emails, as: :recipient, dependent: :destroy
  has_many :phones, as: :owner, dependent: :destroy
  has_many :addresses, as: :location, dependent: :destroy

  def address
    location = addresses[0]
    address = location.street1
    address += "\n#{location.street2}" if location[:street2]
    address += "\n#{location.city}, #{location.state} #{location.zip_code}"
    address
  end
end
