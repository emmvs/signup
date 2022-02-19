class Sign < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :bookmarks, dependent: :destroy
  validates :title, :language, presence: true
  has_one_attached :sign
end
