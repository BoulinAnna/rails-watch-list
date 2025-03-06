class List < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  has_many :movies, through: :bookmarks, dependent: :destroy

  validates :name, presence: true
  validates :name, uniqueness: true
  # Quand tu supprimes une liste, tu dois supprimer tous les signets associés (mais pas les films, car ils peuvent être indiqués en référence dans d’autres listes)
end
