class Category < ApplicationRecord
  belongs_to :user
  has_many :words
  validates :title, presence: true
end
