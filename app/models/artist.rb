class Artist < ApplicationRecord
  validates :name, presence: true

  def self.with_name(name)
    where(
      'LOWER(name) = ?', name.downcase
    ).first_or_create(name: name)
  end
end
