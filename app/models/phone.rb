class Phone < ApplicationRecord
  belongs_to :owner, polymorphic: true

  validates :number, presence: true
end
