module FavoriteAlbumDecorator
  module ClassMethods
    def associated
      includes(
        [album: :artist],
        image_association
      )
    end
  end

  def self.included(base)
    base.extend ClassMethods
  end
end
