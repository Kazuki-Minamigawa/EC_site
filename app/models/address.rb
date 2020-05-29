class Address < ApplicationRecord
  belongs_to :end_user

  def full_address
    self.zip_code + self.address + self.name
  end
end
