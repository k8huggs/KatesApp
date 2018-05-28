class Order < ApplicationRecord
  belongs_to :product
  belonts_to :user
end
