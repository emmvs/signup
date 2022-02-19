class Category < ApplicationRecord
  belongs_to :user
  has_many :signs
  validates :title, presence: true

  include PgSearch::Model
  multisearchable against: [:title]

end
