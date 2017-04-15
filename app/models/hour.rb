class Hour < ApplicationRecord
  belongs_to :lighting_vendor, foreign_key: :vendor_id
end
