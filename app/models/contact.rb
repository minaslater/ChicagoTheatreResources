class Contact < ApplicationRecord
  belongs_to :employer, polymorphic: true
end
