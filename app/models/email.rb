class Email < ApplicationRecord
  belongs_to :recipient, polymorphic: true

  validates :address, presence: true
end
