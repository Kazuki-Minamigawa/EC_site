class Order < ApplicationRecord
  belongs_to :end_user
  has_many :order_details, dependent: :destroy

  enum ordered_process: { waiting: 0, checked: 1, making: 2, preparing: 3, sent: 4}
  enum payment_method: { card: 0, bank: 1}
end
