module ArtistDecorator
  module ClassMethods
    def with_name(name)
      where(
        name_downcase: name.strip.downcase
      ).first_or_create(
        name: name.strip
      )
    rescue ActiveRecord::RecordNotUnique
      clear_cache

      retry
    end

    def associated
      includes(
        image_association
      )
    end
  end

  def self.included(base)
    base.extend ClassMethods
  end
end
