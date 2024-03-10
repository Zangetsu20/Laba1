class Orderable < ApplicationRecord
  belongs_to :style
  belongs_to :cart
  def total
    style.price * quantity
  end
end
