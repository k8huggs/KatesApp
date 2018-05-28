class Order < ApplicationRecord::Base
  belongs_to :product
  belonts_to :user
end
