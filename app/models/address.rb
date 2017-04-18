class Address < ApplicationRecord
  belongs_to :location, polymorphic: true

  def combine
    address = street1
    address += "\n#{street2}" if street2
    address += "\n#{city}, #{state} #{zip_code}"
    address
  end
end
