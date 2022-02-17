class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :words
  has_many :categories
  has_many :lists, dependent: :destroy
  has_many :bookmarks, through: :words
  validates :username, :email, :language, :target_language, presence: true
end
