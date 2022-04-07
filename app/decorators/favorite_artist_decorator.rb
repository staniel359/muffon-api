module FavoriteArtistDecorator
  module ClassMethods
    def associated
      includes(
        artist: image_association
      )
    end
  end

  def self.included(base)
    base.extend ClassMethods
  end
end
