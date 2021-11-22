class Movie < ApplicationRecord
  validates :title, uniqueness: true
  validates :overview, presence: true
  validates :title, presence: true
  has_many :bookmarks
end
