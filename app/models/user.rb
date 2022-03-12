class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :signs
  has_many :categories
  # has_many :lists, dependent: :destroy
  has_many :bookmarks, through: :signs
  validates :email, presence: true
  validates :username, presence: true
  enum reputation: { unflagged: 0, flagged: 1 }
end
