class ClassicalMuslim < ActiveRecord::Base
  has_many :adherents
  has_many :factions, through: :adherents

  has_many :ethnic_identities
  has_many :ethnicities, through: :ethnic_identities
  
  has_many :positions
  has_many :titles, through: :positions  
  has_many :scopes, through: :positions

  has_many :life_events
  has_many :events, through: :life_events

  has_many :subject_relationships, class_name: "relationships"
  has_many :object_relationships, class_name: "relationships"
  


  # Remember to create a migration!
end
