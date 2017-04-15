class Phone < ApplicationRecord
  belongs_to :owner, polymorphic: true
end
