class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cart_items

  def active_for_authentication?
    super && (self.is_unsubscribed == true)
  end


  validates :first_name, presence:  true
  validates :last_name, presence:  true
  validates :first_name_kana, presence:  true
  validates :first_name_kana, presence:  true
  validates :zip_code, presence:  true
  validates :address, presence:  true
  validates :telephone_number, presence:  true

end
