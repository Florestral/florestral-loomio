class Lot < ApplicationRecord
  has_and_belongs_to_many :users

  # Define searchable attributes for Ransack
  def self.ransackable_attributes(auth_object = nil)
    ["id", "title", "location", "size", "description", "created_at", "updated_at"]
  end

  # Define searchable associations for Ransack
  def self.ransackable_associations(auth_object = nil)
    ["users"] # Allow searching by associated users
  end
end