class Address < ApplicationRecord
  belongs_to :location, polymorphic: true
end
