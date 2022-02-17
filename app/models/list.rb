class List < ApplicationRecord
  belongs_to :user
  has_many :bookmarks, dependent: :destroy
  validates :title, presence: true
end
