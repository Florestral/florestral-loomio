class Lot < ApplicationRecord
  has_and_belongs_to_many :users

  # Define searchable attributes for Ransack
  def self.ransackable_attributes(auth_object = nil)
    ["id", "title", "location", "size", "description", "created_at", "updated_at"]
  end

  # Optionally define which associations are searchable (if any)
  def self.ransackable_associations(auth_object = nil)
    []
  end
end