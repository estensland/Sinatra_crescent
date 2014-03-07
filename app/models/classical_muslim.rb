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

  has_many :subject_relationships, class_name: "Relationship", foreign_key: "subject_id"
  has_many :object_relationships, class_name: "Relationship", foreign_key: "object_id"
  
  def descriptions
    Description.where(table: "classical_muslims").where(parent_id: "#{self.id}")
  end

  def siblings
    return false unless self.object_relationships.first
    self.object_relationships.first.subject.subject_relationships.map do |sib|
      sib
    end
  end

  def uncles
    return false unless self.object_relationships.first
    self.object_relationships.first.subject.siblings.map do |uncle|
      uncle
    end
  end

  def nephews
    return false unless self.object_relationships.first
    self.siblings.map do |sib|
      sib.subject_relationships.map do |son|
        son
      end
    end
  end

end
