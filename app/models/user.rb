class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one :bank_account

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  accepts_nested_attributes_for :bank_account, allow_destroy: true
  validates :first_name, :last_name, presence: true
  after_create :generate_bank_account_details

  def generate_bank_account_details
    create_bank_account!(account_number: rand(10**10))
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
