class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Validations
  validates :email, presence: true, uniqueness: true
  validates :encrypted_password, presence: true
  validates :firstname, :lastname, :shopname, :address, :city, :country, :phone, presence: true

  has_many :items, dependent: :destroy

end