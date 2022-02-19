class Category < ApplicationRecord
  belongs_to :user
  has_many :signs
  validates :title, presence: true
end
