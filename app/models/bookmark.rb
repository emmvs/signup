class Bookmark < ApplicationRecord
  belongs_to :sign
  # belongs_to :list
  belongs_to :user
  validates :sign, presence: true
end
