class Bookmark < ApplicationRecord
  belongs_to :word
  belongs_to :list
end
