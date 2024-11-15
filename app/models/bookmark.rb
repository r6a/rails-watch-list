class Bookmark < ApplicationRecord
  belongs_to :list
  belongs_to :movie
  validates :comment, presence: true, length: { minimum: 6 }
  validates :list, presence: true
  validates :movie, presence: true
  validates :movie, presence: true, uniqueness: { scope: :list }
end
