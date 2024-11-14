class Movie < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  validates :overview, presence: true
  validates :title, presence: true
end
