class Sign < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :bookmarks, dependent: :destroy
  validates :title, presence: true
  has_one_attached :video

  include PgSearch::Model
  multisearchable against: [:title, :description]

  pg_search_scope :global_search, against: {
    title: 'A',
    description: 'B',
  },
    # against: [:title, :description],
    using: {
      tsearch: { prefix: true }
    }
end
