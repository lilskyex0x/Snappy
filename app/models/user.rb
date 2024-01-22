class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :authored_categories, class_name: 'Category', foreign_key: 'author_id'
  has_many :authored_transactions, class_name: 'Transaction', foreign_key: 'author_id'

  validates :name, presence: true
end
