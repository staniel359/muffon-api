module TagDecorator
  module ClassMethods
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

  def self.included(base)
    base.extend ClassMethods
  end
end
