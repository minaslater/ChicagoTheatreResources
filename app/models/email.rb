class Email < ApplicationRecord
  belongs_to :recipient, polymorphic: true
end
