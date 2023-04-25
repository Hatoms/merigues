class Order < ApplicationRecord
    belongs_to :customer
    belongs_to :basket

    validates :customer_id, uniqueness: { scope: :basket_id, message: "Order already exist for this customer and basket." }
    
  end