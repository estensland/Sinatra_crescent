class Faction < ActiveRecord::Base
  has_many :adherents
  has_many :classical_muslims, through: :adherents
  # has_many
  # belongs_to
  # Remember to create a migration!
end
