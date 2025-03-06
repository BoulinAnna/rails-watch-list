class Movie < ApplicationRecord
  has_many :bookmarks

  validates :title, presence: true
  validates :title, uniqueness: true
  validates :overview, presence: true
  # Tu ne peux pas supprimer de film s’il est indiqué en référence dans au moins un signet
end
