class Sign < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :bookmarks, dependent: :destroy
  validates :title, presence: true
  has_one_attached :video
  enum status: { open: 0, verified: 1 }
  enum language: { german: 0, english: 1, french: 2 , albanian: 3, bulgarian: 4 }

  include PgSearch::Model
  multisearchable against: [:title, :description, :language]

  pg_search_scope :global_search,
                  against: {
                    title: 'A',
                    description: 'B',
                    language: 'C'
                  },
                  using: {
                    tsearch: { prefix: true }
                  }
end
