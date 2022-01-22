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
    rescue ActiveRecord::RecordNotUnique
      clear_cache

      retry
    end
  end
end
