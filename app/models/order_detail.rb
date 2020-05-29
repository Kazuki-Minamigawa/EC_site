class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item

  enum made_process: { until: 0, waiting: 1, making: 2, done: 3 }
end
