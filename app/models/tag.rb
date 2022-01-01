class Tag < ApplicationRecord
  validates :name,
            presence: true,
            uniqueness: true

  class << self
    def with_name(name)
      where(
        'LOWER(name) = ?',
        name.strip.downcase
      ).first_or_create(
        name:
      )
    end
  end
end
