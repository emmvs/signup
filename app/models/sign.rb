class Sign < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :bookmarks, dependent: :destroy
  validates :title, :language, presence: true
  has_one_attached :sign

  include PgSearch::Model
  multisearchable against: [:title, :description]

  pg_search_scope :global_search,
    against: [:title, :description],
    using: {
      tsearch: { prefix: true }
    }
end
