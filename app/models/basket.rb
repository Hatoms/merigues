class Basket < ApplicationRecord
    has_many :orders
    has_many :customers, through: :orders

    def orders_sort_by_time
      self.orders.sort_by{ |c| c.created_at} #mettre décroissant
    end
  end